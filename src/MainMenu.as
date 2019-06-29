package 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Lazi
	 */
	
	 
	public class MainMenu extends Sprite 
	{
		private var BG:SpriteSheet;
		private var animations:SpriteSheet;
		private var textbox1:TextBox; 
		private var frameNo:int;
		
		public function MainMenu() : void{
			addEventListener(Event.ADDED_TO_STAGE, go);
			addEventListener(Event.REMOVED_FROM_STAGE, die);
			frameNo = 0;	
			BG = new SpriteSheet(new Assets.SpriteSheetTiles);
			animations = new SpriteSheet(new Assets.Loggy, 32, 32);
			var book1:Array = new Array();
			book1.push("page1");
			book1.push("page2");
			book1.push("page3");
			book1.push("page4");
			book1.push("page5");
			textbox1 = new TextBox(50,50, book1);
			textbox1.addPage("page6");
			addChild(BG);
			addChild(animations);
			addChild(textbox1);
		}
		private function go(e:Event) :void
		{
			removeEventListener(Event.ADDED_TO_STAGE, go);
			addEventListener(Event.ENTER_FRAME, enterFrame, false, 0, true);
			
			var tiles:Array = new Array();
			var chars:Array = new Array();
			var hold1:Array = new Array(int(stage.stageHeight/16));
			var hold2:Array = new Array(int(stage.stageHeight/32));
			for (var i:int = 0; i < int(stage.stageHeight / 32); i++ )
			{
				for (var j:int = 0; j < int(stage.stageWidth / 32);j++ )
				{
					
					
					
						hold2[j] = 23;
					
				}
				
				chars.push(hold2);
				
			}
			for (var i:int = 0; i < int(stage.stageHeight / 16); i++ )
			{
				for (var j:int = 0; j < int(stage.stageWidth / 16);j++ )
				{
					hold1[j] = 63;
					
					
				}
				tiles.push(hold1);
			
				
			}
			BG.tileBoard(tiles);
			animations.tileBoard(chars);
			frameNo = 0;
			animations.animate(new Point(0, int((stage.stageHeight/32)*30)), new Array([0]));
			animations.animate(new Point(0, 0), new Array([0]));
			animations.animate(new Point(int((stage.stageWidth/32)*30.5), int((stage.stageHeight/32)*30)), new Array([0]));
			animations.animate(new Point(int((stage.stageWidth/32)*30.5),0) , new Array([0]));
			
			
			textbox1.addNext(); 
			
			
		}
		public function enterFrame(e:Event):void
		{
			if (frameNo == 8)
			{
				frameNo = 0;
			}
			if (frameNo % 8 == 0)
			{
				animations.animate(new Point(0, int((stage.stageHeight/32)*30)), new Array([0]));
				animations.animate(new Point(0, 0), new Array([0]));
				animations.animate(new Point(int((stage.stageWidth/32)*30.5), int((stage.stageHeight/32)*30)), new Array([0]));
				animations.animate(new Point(int((stage.stageWidth/32)*30.5),0) , new Array([0]));
				
			}
			else if (frameNo % 8 == 2)
			{
				animations.animate(new Point(0, int((stage.stageHeight/32)*30)), new Array([1]));
				animations.animate(new Point(0, 0), new Array([1]));
				animations.animate(new Point(int((stage.stageWidth/32)*30.5), int((stage.stageHeight/32)*30)), new Array([1]));
				animations.animate(new Point(int((stage.stageWidth/32)*30.5),0) , new Array([1]));
				
			}
			else if (frameNo % 8 == 4)
			{
				animations.animate(new Point(0, int((stage.stageHeight/32)*30)), new Array([2]));
				animations.animate(new Point(0, 0), new Array([2]));
				animations.animate(new Point(int((stage.stageWidth/32)*30.5), int((stage.stageHeight/32)*30)), new Array([2]));
				animations.animate(new Point(int((stage.stageWidth/32)*30.5),0) , new Array([2]));
				
			}
			else if (frameNo % 8 == 6)
			{
				animations.animate(new Point(0, int((stage.stageHeight/32)*30)), new Array([3]));
				animations.animate(new Point(0, 0), new Array([3]));
				animations.animate(new Point(int((stage.stageWidth/32)*30.5), int((stage.stageHeight/32)*30)), new Array([3]));
				animations.animate(new Point(int((stage.stageWidth/32)*30.5),0) , new Array([3]));
				
			}

			
			
			
			
			
			frameNo++;
		}
		public function die(e:Event):void
		{
			
		}
		
		
		
		
	}
	
}