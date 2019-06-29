package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Lazi
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var spriteSheet:SpriteSheet = new SpriteSheet(Bitmap(new Assets.SpriteSheetTiles), 16, 16,32,32);
			//var bg:SpriteSheet = new SpriteSheet(Bitmap(new Assets.SpriteSheetTiles), 16, 16,32,32);
			//var mainMenu:MainMenu = new MainMenu();
			var game:Game = new Game();
			addChild(game);
			//addChild(mainMenu);
			
			
			
			//addChild(bg);
		//	addChild(spriteSheet);
			
			//add a layer of completly grass, or whatever is suitable as a background, so when you add transparencies they dont look terrible.
			
			
			//bg.tileBoard(new Array([0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]));
			//bg.tileBoard(new Array([0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0],[0,0,0,0,0],[0,0,0,0,0]));
			spriteSheet.tileBoard(new Array([1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1],[1,1,1,1,1],[1,1,1,1,1]));
			spriteSheet.animate(new Point(0, 0), TileTypes.HOUSELCHIMNEY);
			//spriteSheet.animate(new Point(0, 0), TileTypes.FOUNTAIN3);
			
			
			//bg.x-=5;
			//spriteSheet.x-=5;
			
			
			
			//spriteSheet.tileBoard(new Array([16, 17, 0, 0, 0, 0], [56, 57, 0, 0, 0, 0]));
			
			//spriteSheet.animate(new Point(32, 0), new Array([18, 19], [58, 59]));

			//spriteSheet.animate(new Point(64, 0), new Array([20, 21], [60, 61]));
			
			
			//var waterDrop:Array = new Array([[16,17], [56,57]], [[18,19], [58,59]], [[20,21], [60,61]], [[96,97], [136,137]], [[98,99], [138,139]], [[100,101], [140.141]]);
			
		}
		
	}
	
}