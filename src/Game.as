package 
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.events.Event;
	import flash.ui.Keyboard;;
	/**
	 * ...
	 * @author Lazi
	 */
	public class Game extends Sprite 
	{
		public static var player1:Player;
		public static var backGround:SpriteSheet;
		private static var myMap:Map;
		public static var movingLeft:Boolean;
		public static var movingRight:Boolean;
		public static var movingUp:Boolean;
		public static var movingDown:Boolean;
		public static var facingLeft:Boolean;
		public static var facingRight:Boolean;
		public static var facingUp:Boolean;
		public static var facingDown:Boolean;
		public static var speed:int;
		public static var mypos:Point;
		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE, go);
			addEventListener(Event.REMOVED_FROM_STAGE, die);
			
			speed = 5;
			movingDown = false;
			movingLeft = false;
			movingUp = false;
			movingRight = false;
			facingDown = true;
			facingLeft = false;
			facingUp = false;
			facingRight = false;
			mypos = new Point(0, 0);
		}
		
		public function go(e:Event):void
		{
		
			player1 = new Player(stage.stageWidth/2, stage.stageHeight/2 );
			myMap = new Map(1);
			
			
			removeEventListener(Event.ADDED_TO_STAGE, go);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler, false, 0, true);
			addEventListener(Event.ENTER_FRAME, enterFrame, false, 0, true);
			
			
			addChild(myMap);
			addChild(player1);
			myMap.x= 0-500;//rehardcode later to give much larger board
			myMap.y = 0 - 500;//rehardcode later to give much larger board
			
			//myMap.x = 0;
			//myMap.y = 0;
			
			
			
			mypos = new Point(-500, -500);
			//player1.scaleX = 2;
			//player1.scaleY = 2;
			
			//NB walking animation too fast, also change so its a function of speed, so that every animation ends in a standing position. 
		}
		
		public function keyDownHandler(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.LEFT)
			{
				movingLeft = true;
				facingLeft = true;
				facingDown = false;
				facingRight = false;
				facingUp = false;
			}
			else if (e.keyCode == Keyboard.RIGHT)
			{
				
				movingRight = true;
				facingLeft = false;
				facingDown = false;
				facingRight = true;
				facingUp = false;
			}
			else if (e.keyCode == Keyboard.UP)
			{
				
				movingUp = true;
				facingLeft = false;
				facingDown = false;
				facingRight = false;
				facingUp = true;
			}
			else if (e.keyCode == Keyboard.DOWN)
			{
				
				movingDown = true;
				facingLeft = false;
				facingDown = true;
				facingRight = false;
				facingUp = false;
			}
		}
		public function keyUpHandler(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.LEFT)
			{
				movingLeft = false;
				
			}
			if (e.keyCode == Keyboard.RIGHT)
			{
				movingRight = false;
			}
			if (e.keyCode == Keyboard.UP)
			{
				movingUp = false;
			}
			if (e.keyCode == Keyboard.DOWN)
			{
				movingDown = false;
			}
		}
		public function enterFrame(e:Event):void
		{
			if (movingLeft)
			{
				
				mypos.x+=speed;
				
				if (player1.x>200)
				{
					player1.x -= speed;
				}
				else
				{
					myMap.x += speed;
					if (myMap.x >= x)
					{
						myMap.x = x;
						player1.x -= speed;
					}
				}
			}
			if (movingRight)
			{
				mypos.x -= speed;
				if (player1.x<200)
				{
					player1.x += speed;
				}
				else
				{
					myMap.x -= speed;
					if (myMap.x+1000<=x+stage.stageWidth+8)
					{
						myMap.x = x+stage.stageWidth-1000+8;
						player1.x += speed;
						
					}
				}
			}
			if (movingUp)
			{
				mypos.y += speed;
				if (player1.y>144)
				{
					player1.y -= speed;
				}
				else
				{
					myMap.y += speed;
					if (myMap.y >= y)
					{
						myMap.y = y;
						player1.y -= speed;
					}
				}
			}
			if (movingDown)
			{
				mypos.y -= speed;
				if (player1.y<144)
				{
					player1.y += speed;
				}
				else
				{
					myMap.y -= speed;
					if (myMap.y+1000<=y+stage.stageWidth+8)
					{
						myMap.y = y+stage.stageWidth-1000+8;
						player1.y += speed;
					
					}
				}
			}
			
			
		}
		public function die(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, die);

			
		}
		
	}
	
}