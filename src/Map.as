package 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.GridFitType;
	import flash.ui.Keyboard;
	import flash.ui.KeyLocation;
	/**
	 * ...
	 * @author Lazi
	 */
	public class Map extends Sprite 
	{
		//TODO:NB make method that only makes a small area at a time of where you are. so that when its made, it only makes small areas every frame, instead of the entire map in the beginning
		//IDEA: maybe make array of spritesheets, each for a specific area, that make up the full map together, then display the 0ones neccesary
		
		private var backGround:SpriteSheet;
		private var environment:SpriteSheet;
		private var animations:Array;
		private var objects:SpriteSheet;
		private var levelNo:int;
		private var frameNo:int;
		
		private var indoorBackground:SpriteSheet;
		private var indoorEnvironment:SpriteSheet;
		private var indoorObjects:SpriteSheet;
		
		private var grid:Array=new Array();
		public var myPos:Point;//position of screen on total map(top left corner) 
		private var setPos:Boolean; 
		
		
		private var smallBG:SpriteSheet;
		private var smallFG:SpriteSheet;
		
		private var smallBGInside:SpriteSheet;
		private var smallFGInside:SpriteSheet;
		
		
		
		private var prevMyPos:Point;
		
		private var backgrounds:Array;
		
		
		public function Map(levelNo:int)
		{
			addEventListener(Event.ADDED_TO_STAGE, go);
			addEventListener(Event.REMOVED_FROM_STAGE, die);
			backgrounds = new Array();
			this.levelNo = levelNo;
			frameNo = 0;
			setPos = false;
			backGround = new SpriteSheet(new Assets.SpriteSheetTiles, 16, 16);
			environment = new SpriteSheet(new Assets.SpriteSheetTiles, 16, 16);
			indoorBackground = new SpriteSheet(new Assets.Inside, 16, 16);
			indoorEnvironment = new SpriteSheet(new Assets.Inside, 16, 16);
			
			smallBG = new SpriteSheet(new Assets.SpriteSheetTiles);
			smallFG = new SpriteSheet(new Assets.SpriteSheetTiles);
			
			
			
			objects = new SpriteSheet(new Assets.Stuff);
			myPos = new Point(0, 0);
			prevMyPos = myPos;
			var arr:Array = new Array();
			
			
			
			
			
			
			var hold:Array = new Array(int(1000/16));//var hold:Array = new Array(stage.stageWidth/16*2);//rehardcode later to give much larger board
			
			for (var i:int = 0; i < int(1000/16); i++ )//for (var i:int = 0; i < stage.stageHeight/16*2; i++ )//rehardcode later to give much larger board
			{
				for (var j:int = 0; j < int(1000/16); j++ )//for (var j:int = 0; j < stage.stageWidth/16*2; j++ )//rehardcode later to give much larger board
				{
					hold[j] = 0;
				}
				arr.push(hold);
			}
			/*
			var arr2:Array = new Array();
			hold = new Array(int(400 / 16) + 2);
			for (var k:int = 0; k < (int(288 / 16)) + 2 ; k++ )
			{
				for (var l:int = 0; l < int(400/ 16 )+ 2 ; l++ )
				{
					
					hold[l] = 0;
					
					
					
				}
				
			
				arr2.push(hold);
				
				
			}
			*/
			
			
			
			
			backGround.tileBoard(arr); // bring back if neccesary, trying something new with grids
			environment.tileBoard(arr); //bring back if neccesary, trying something new with grids
			
			//smallBG.tileBoard(arr2);
			//smallFG.tileBoard(arr2);
			
			
		//	objects.tileBoard(arr);
			
		}
		public function go(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, go);
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			if (levelNo == 1)
			{
				initialiseGrid(10000, 10000);//10000,10000
				addChild(backGround); //bring back if neccesary, trying something new with grids
				addChild(environment); //bring back if neccesary, trying something new with grids
				//addChild(smallBG);// trying new method, using multiple spritesheets
				//addChild(smallFG);//trying new method, using multiple spritesheets
				
				//grid method
				
			
					
			}
			if (levelNo == 2)
			{
				addChild(indoorBackground);	
				addChild(indoorEnvironment);
				
			}
			//addChild(objects);
			
			addEventListener(Event.ENTER_FRAME, enterFrame, false, 0, true);
			
			
			if (levelNo == 1)
			{
				environment.animate(new Point(16, 16), TileTypes.HOUSELCHIMNEY);
				environment.animate(new Point(450, 450), TileTypes.MINIPOOL);
				environment.animate(new Point(800, 30), TileTypes.FOUNTAIN1);
				placeArray(new Point(800, 30), TileTypes.FOUNTAIN1, grid);
				placeArray(new Point(450, 450), TileTypes.MINIPOOL, grid);
				placeArray(new Point(16, 16), TileTypes.HOUSELCHIMNEY, grid);
				
				//for (var i:int = 0; i < 10000 / 125; i++ )//we have 125 divisions, each division is 80*80 px, ie 5 sprites accross and down. this leaves a maximum of 25 aquares at one time. i dont think this will work.
				for (var i:int = 0; i < 10000 / 400; i++ )//we have 25 divisions, each division is 400*400 px, ie 25 sprites accross and down. this leaves a maximum of 4 aquares at one time. this could work well
				{
					var ss:SpriteSheet = new SpriteSheet(new Assets.SpriteSheetTiles);
			//		ss.tileBoard(getSubArray(new Point(),, );
					backgrounds.push(ss);
				}
				
				
				
			}
			else
			{
				
				
			}
		}
		
		//TODO: make a variable for players position, so you only have to check 9 squares for collisions
		public function enterFrame(e:Event):void
		{
			//if ((Game.mypos.x!=0 && Game.mypos.y!=0))
			//{
				var mapPos:Point = Game.mypos;
				
				myPos = new Point(0 - mapPos.x, 0 - mapPos.y);
				//trace(myPos.x,myPos.y);
				//setPos = true;
				
				
				
			//}
			var screen:Array;
			if (prevMyPos != myPos)
			{
				//screen = getSubArray(myPos, 400, 288);
				
				var rect:Rectangle = new Rectangle(myPos.x, myPos.y, 400, 288);
				
				
				
				
				/*
				 *this is old method, using grid to display each individual square. gonna try using a few spritesheets 
				 
				//if (!isEmpty(screen))
				//{
					//IDEA: make loading screen. while loading, create an image generated from grid. add a few images at a time until you have your picture
					//IDEA: consider using first method, except using copy pixels to only display whats on the screen. it will make certain things harder, but should be a lot faster
					//IDEA: check speed columns or rows, depending on which direction travelling. maybe make an array to store all non 0 positions, update when one goes off screen, so not everything has to be checked
					//IDEA: consider making a few(maybe a lot)images, each containing a few tiles. the you tile the board with them, filling the screen. theres no for loops neccesary, escept maybe through the images, so be careful how many there are.
					
					for (var i:int; i < 288;i++ )
					{
						for (var j:int = 0; j < 400;j++ )
						{
							if (screen[i][j] != 0)
							{
								smallFG.animate(new Point(j, i), new Array([screen[i][j]]));
								
							}
						}
					}
					*/
					
				//}
				prevMyPos = myPos;
			}
			
			if (frameNo == 60)
			{
				frameNo = 0;
			}
			if (levelNo == 1)
			{
				//
				if (frameNo % 60 == 0 || frameNo % 60 == 30)
				{
					environment.animate(new Point(800, 30), TileTypes.FOUNTAIN1);
				}
				if (frameNo % 60 == 10 || frameNo % 60 == 40 )
				{
					environment.animate(new Point(800, 30), TileTypes.FOUNTAIN2);
				}
				if (frameNo % 60 == 20 || frameNo % 60 == 50 )
				{
					environment.animate(new Point(800, 30), TileTypes.FOUNTAIN3);
				}
				
			
			}
			else
			{
				
				
			}
			frameNo++;
		}
		
		private function initialiseGrid(width:int,height:int):void
		{
			grid = new Array(width);
			for (var i:int = 0; i < width; i++ )
			{
				grid[i]=new Array(height);
				
				
				
			}
			/*
			for (var i:int = 0; i < height; i++ )
			{
				for (var j:int = 0; j < width; j++)
				{
					grid[i][j] = 0;
					
				}
			}
			*/
			
			
		}
		
		private function placeArray(start:Point, arr:Array,grid:Array):void
		{
			
			for (var i:int = 0; i < arr[0].length; i++ )
			{
				for (var j:int = 0; j < arr.length; j++ )
				{
					grid[start.y + i *16][start.x + j *16] = arr[i][j];
				}
				
			}
			//print(grid);
		}
		
		private function getSubArray(start:Point, width:int,height:int,num:int=0 ):Array
		{
			var arr:Array = new Array(height);
			for (var i:int = 0; i < height; i++ )
			{
				arr[i] = new Array(width);
				
				
			}
			
			for (var i:int = 0; i < height; i++ )
			{
				for (var j:int = 0; j < width; j++ )
				{
					arr[i][j] = grid[start.y+i][start.x+j];
				}
			}
			
			return arr;
			
		}
		
		
		private function isEmpty(arr:Array):Boolean
		{
			for (var i:int = 0; i < arr[0].length; i++ )
			{
				for (var j:int = 0; j < arr.length; j++ )
				{
					if (arr[j][i] != 0)
					{
						return false
					}
				}
			}
			return true;
		}
		
		private function print(grid:Array):void
		{
			for (var i:int = 0; i < grid.length; i++ )
			{
				var x:String = new String("");
				for (var j:int = 0; j < grid[i].length; j++ )
				{
					if (grid[i][j] == null)
					{
						x += " " + "000";
					}
					else
					{
						x += " " + grid[i][j];
					}
				}
				trace(x);
				x = "";
			}
			
		}
		
		public function die(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, die);

			
		}
		
	}
	
}