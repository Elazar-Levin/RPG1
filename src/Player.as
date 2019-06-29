package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Lazi
	 */
	public class Player extends Sprite
	{
		private var myPlayer:SpriteSheet;
		private var frameNo:int;
		private var timeLapse:int;
		private var completingStop:Boolean;
		public static var attacking:Boolean; 
		private var attackinStage:int;
		private var attackCount:int;
		
		//TODO: syncronise walking with speed
		
		public function Player(x:int,y:int)
		{
			completingStop = false;
			attackCount = 0;
			addEventListener(Event.ADDED_TO_STAGE, go);
			addEventListener(Event.REMOVED_FROM_STAGE, die);
			attacking = false;
			attackinStage = 0;
			this.x = x;
			this.y = y;
			frameNo = 0;
			myPlayer = new SpriteSheet(new Assets.Char2,16,32);
			myPlayer.tileBoard(new Array([0]));
		}
		public function go(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, go);
			addEventListener(Event.ENTER_FRAME, enterFrame, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, interupt, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp, false, 0, true);
			
			addChild(myPlayer);
		}
		
		public function enterFrame(e:Event):void
		{
			if (timeLapse >= 1000)
			{
				timeLapse = 1000;
				
				if (Game.facingDown)
				{
					if (frameNo % 36 == 0)
					{
						myPlayer.animate(new Point(0, 0), new Array([5]));
						
					}
					if (frameNo % 36 == 9)
					{
						myPlayer.animate(new Point(0, 0), new Array([6]));
					}
					if (frameNo % 36 == 18)
					{
						myPlayer.animate(new Point(0, 0), new Array([7]));
					}
					if (frameNo % 36 == 27)
					{
						myPlayer.animate(new Point(0, 0), new Array([6]));
					}
				}
				else if (Game.facingUp)
				{
					if (frameNo % 36 == 0)
					{
						myPlayer.animate(new Point(0, 0), new Array([39]));
						
					}
					if (frameNo % 36 == 9)
					{
						myPlayer.animate(new Point(0, 0), new Array([40]));
					}
					if (frameNo % 36 == 18)
					{
						myPlayer.animate(new Point(0, 0), new Array([41]));
					}
					if (frameNo % 36 == 27)
					{
						myPlayer.animate(new Point(0, 0), new Array([40]));
					}
					
				}
				else if (Game.facingLeft)
				{
					if (frameNo % 36 == 0)
					{
						myPlayer.animate(new Point(0, 0), new Array([51]));
						
					}
					if (frameNo % 36 == 9)
					{
						myPlayer.animate(new Point(0, 0), new Array([57]));
					}
					if (frameNo % 36 == 18)
					{
						myPlayer.animate(new Point(0, 0), new Array([58]));
					}
					if (frameNo % 36 == 27)
					{
						myPlayer.animate(new Point(0, 0), new Array([57]));
					}
					
				}
				else if (Game.facingRight)
				{
					if (frameNo % 36 == 0)
					{
						myPlayer.animate(new Point(0, 0), new Array([17]));
						
					}
					if (frameNo % 36 == 9)
					{
						myPlayer.animate(new Point(0, 0), new Array([23]));
					}
					if (frameNo % 36 == 18)
					{
						myPlayer.animate(new Point(0, 0), new Array([24]));
					}
					if (frameNo % 36 == 27)
					{
						myPlayer.animate(new Point(0, 0), new Array([23]));
					}
					
				}
				
			}
			
			if (attackCount >= 24)
			{
				attackCount = 0;
			}
			if (attackCount % 24 == 0)
			{
				if (attackinStage == 3)
				{
					attacking = false;
				}
				attackinStage = 0;
				
			}
			if (attackCount % 24 == 6)
			{
				attackinStage = 1;
			}
			if (attackCount % 24 == 12)
			{
				attackinStage = 2;
			}
			if (attackCount % 24 == 18)
			{
				attackinStage = 3;
			}
			
			if (attacking)
			{
			
				if (Game.facingLeft)
				{
					myPlayer.animate(new Point( -8, 0), new Array([119+attackinStage,120+attackinStage]));
				}
				else if (Game.facingRight)
				{
					myPlayer.animate(new Point( -8, 0), new Array([102+attackinStage,103+attackinStage]));
				}
				else if (Game.facingUp)
				{
					myPlayer.animate(new Point( -8, 0), new Array([85+attackinStage,86+attackinStage]));
				}
				else if (Game.facingDown)
				{
					myPlayer.animate(new Point( -8, 0), new Array([68+attackinStage,69+attackinStage]));
				}
										
				
				attackCount++;
			}
			
			
			var playerRect:Rectangle = new Rectangle(x, y, 16, 32);//hardcoding for now, make a variable
			
			var door1:Rectangle = new Rectangle(48, 64, 16, 32);
			
			if (playerRect.containsPoint(door1.bottomRight) || playerRect.containsPoint(new Point(door1.bottomRight.x-16,door1.y)))// doesnt work
			{
				//trace("now");
				
			}
			
			
			
			if (frameNo == 36)
			{
				frameNo=0;
			}
			if (!attacking)
			{
				if (!completingStop)
				{
					normalMove();
				}
				else
				{
					finishMoving();
					//normalMove();	
				}
			}
			
			
			frameNo++;
			timeLapse++;
		}
		public function interupt(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.UP || e.keyCode == Keyboard.DOWN || e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.RIGHT)
			{
				timeLapse = 0;
			}
			
		}
		public function keyUp(e:KeyboardEvent):void
		{
			if (frameNo % 12 != 0)
			{
					completingStop = true;
				
				
				
				
			}
			else
			{
				if (e.keyCode == Keyboard.DOWN)
				{
					myPlayer.animate(new Point(0, 0), new Array([0]));
				}
				if (e.keyCode == Keyboard.UP)
				{
					myPlayer.animate(new Point(0, 0), new Array([34]));
				}
				if (e.keyCode == Keyboard.LEFT)
				{
					myPlayer.animate(new Point(0, 0), new Array([51]));
				}
				if (e.keyCode == Keyboard.RIGHT)
				{
					myPlayer.animate(new Point(0, 0), new Array([17]));
				}
			}
			
			if (e.keyCode == Keyboard.SPACE && !attacking)
			{
				attacking = true;
			}
			
		}
		
		public function finishMoving():void
		{
				if (frameNo % 12 ==0  || frameNo%12==6 )
				{
					completingStop = false;
					if (Game.facingLeft)
					{
						myPlayer.animate(new Point(0, 0), new Array([51]));
					}
					if (Game.facingRight)
					{
						myPlayer.animate(new Point(0, 0), new Array([17]));
					}
					if (Game.facingUp)
					{
						myPlayer.animate(new Point(0, 0), new Array([34]));
					}
					if (Game.facingDown)
					{
						myPlayer.animate(new Point(0, 0), new Array([0]));
					}
							
				}
				else
				{
					if (Game.facingLeft)
					{
						//x -= Game.speed/2;
						if (x > 0)
						{
							if (frameNo % 12 == 3)
							{
								myPlayer.animate(new Point(0, 0), new Array([52]));
							}
							if (frameNo % 12 == 9)
							{
								myPlayer.animate(new Point(0, 0), new Array([54]));
							}
						}
						
						
					}
					if (Game.facingRight)
					{
						//x += Game.speed/2;
						if (frameNo % 12 == 3)
						{
							myPlayer.animate(new Point(0, 0), new Array([18]));
						}
						if (frameNo % 12 == 9)
						{
							myPlayer.animate(new Point(0, 0), new Array([20]));
						}
						
						
						
					}
					if (Game.facingUp)
					{
						if (y > 0)
						{
							//y -= Game.speed/2;
							if (frameNo % 12 == 3)
							{
								myPlayer.animate(new Point(0, 0), new Array([35]));
							}
							if (frameNo % 12 == 9)
							{
								myPlayer.animate(new Point(0, 0), new Array([37]));
							}
						}
						
						
					}
					if (Game.facingDown)
					{
						//y += Game.speed/2;
						if (frameNo % 12 == 3)
						{
							myPlayer.animate(new Point(0, 0), new Array([1]));
						}
						if (frameNo % 12 == 9)
						{
							myPlayer.animate(new Point(0, 0), new Array([3]));
						}
						
						
						
					}
				}
		}
		public function normalMove():void
		{
			if (Game.movingLeft)
			{
				if (x>0)
				{
					if (frameNo % 12 == 0)
					{
						myPlayer.animate(new Point(0, 0), new Array([51]));
					}
					else if (frameNo % 12 == 3)
					{
						myPlayer.animate(new Point(0, 0), new Array([52]));
					}
					else if (frameNo % 12 == 6)
					{
						myPlayer.animate(new Point(0, 0), new Array([53]));
					}
					else if (frameNo % 12 == 9)
					{
						myPlayer.animate(new Point(0, 0), new Array([54]));
					}
				}
				
				
					
				
			}
			if (Game.movingRight)
			{
				if (frameNo % 12 == 0)
				{
					myPlayer.animate(new Point(0, 0), new Array([17]));
				}
				else if (frameNo % 12 == 3)
				{
					myPlayer.animate(new Point(0, 0), new Array([18]));
				}
				else if (frameNo % 12 == 6)
				{
					myPlayer.animate(new Point(0, 0), new Array([19]));
				}
				else if (frameNo % 12 == 9)
				{
					myPlayer.animate(new Point(0, 0), new Array([20]));
				}
				
			}
			if (Game.movingUp)
			{
				if (y>0)
				{
					if (frameNo % 12 == 0)
					{
						myPlayer.animate(new Point(0, 0), new Array([34]));
					}
					else if (frameNo % 12 == 3)
					{
						myPlayer.animate(new Point(0, 0), new Array([35]));
					}
					else if (frameNo % 12 == 6)
					{
						myPlayer.animate(new Point(0, 0), new Array([36]));
					}
					else if (frameNo % 12 == 9)
					{
						myPlayer.animate(new Point(0, 0), new Array([37]));
					}
				}
			}
			if (Game.movingDown)
			{
				if (frameNo % 12 == 0)
				{
					myPlayer.animate(new Point(0, 0), new Array([0]));
				}
				else if (frameNo % 12 == 3)
				{
					myPlayer.animate(new Point(0, 0), new Array([1]));
				}
				else if (frameNo % 12 == 6)
				{
					myPlayer.animate(new Point(0, 0), new Array([2]));
				}
				else if (frameNo % 12 == 9)
				{
					myPlayer.animate(new Point(0, 0), new Array([3]));
				}
				
			}
			
			
			
			
			/*if (frameNo % 12 ==0  || frameNo%12==6 )
				{
					completingStop = false;
					if (Game.facingLeft)
					{
						myPlayer.animate(new Point(0, 0), new Array([51]));
					}
					if (Game.facingRight)
					{
						myPlayer.animate(new Point(0, 0), new Array([17]));
					}
					if (Game.facingUp)
					{
						myPlayer.animate(new Point(0, 0), new Array([34]));
					}
					if (Game.facingDown)
					{
						myPlayer.animate(new Point(0, 0), new Array([0]));
					}
							
				}
				else
				{
					if (Game.facingLeft)
					{
						x -= Game.speed/2;
						if (frameNo % 12 == 3)
						{
							myPlayer.animate(new Point(0, 0), new Array([52]));
						}
						if (frameNo % 12 == 9)
						{
							myPlayer.animate(new Point(0, 0), new Array([54]));
						}
						
						
						
					}
					if (Game.facingRight)
					{
						x += Game.speed/2;
						if (frameNo % 12 == 3)
						{
							myPlayer.animate(new Point(0, 0), new Array([18]));
						}
						if (frameNo % 12 == 9)
						{
							myPlayer.animate(new Point(0, 0), new Array([20]));
						}
						
						
						
					}
					if (Game.facingUp)
					{
						y -= Game.speed/2;
						if (frameNo % 12 == 3)
						{
							myPlayer.animate(new Point(0, 0), new Array([35]));
						}
						if (frameNo % 12 == 9)
						{
							myPlayer.animate(new Point(0, 0), new Array([37]));
						}
						
						
						
					}
					if (Game.facingDown)
					{
						y += Game.speed/2;
						if (frameNo % 12 == 3)
						{
							myPlayer.animate(new Point(0, 0), new Array([1]));
						}
						if (frameNo % 12 == 9)
						{
							myPlayer.animate(new Point(0, 0), new Array([3]));
						}
						
						
						
					}
				}
			
			
			
			*/
			
		}
		
		
		public function collides(rect1:Rectangle,rect2:Rectangle):Boolean
		{
	
			return false;
			
			
		}
		public function die(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, die);
			
		}
		
	}
	
}