package 
{
	import com.adobe.tvsdk.mediacore.TextFormat;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Lazi
	 */
	public class TextBox extends Sprite	
	{
		private var text:SpriteSheet;
		private var BG:SpriteSheet;
		private const MAXLETTERS:int = 28;
		private var next:SpriteSheet;
		private var myBook:StoryBook;
		private var pos:int;
		private var pageTurn:Sound;
		
		public function TextBox(x:Number,y:Number,story:Array=null)
		{
			
			pageTurn = new Assets.PageTurn() as Sound;
			var myText:String;
			if (story == null)
			{
				myText = "";
			}
			else
			{
				myText = story[0];
			}
			
			
			pos = 0;
			this.x = x;
			this.y = y;
			BG = new SpriteSheet(new Assets.Font1, 8, 8);
			text = new SpriteSheet(new Assets.Font1, 8, 8);
			next = new SpriteSheet(new Assets.Font1, 8, 8);
			
			
			myBook = new StoryBook(story);
			
			
			
			
			
			addChild(BG);
			addChild(text);
			
			
			var arr1:Array = new Array();
			var arr2:Array = new Array();
			var arr3:Array = new Array();
			var arr4:Array = new Array();
			var arr5:Array = new Array();
			var arr6:Array = new Array();
			var arr7:Array = new Array();
			var arr8:Array = new Array();
			var arr9:Array = new Array();
			var arr10:Array = new Array();
			for (var t:int; t < 30; t++ )
			{
				arr1.push(180 + t);
				arr2.push(210 + t);
				arr3.push(240 + t);
				arr4.push(270 + t);
				arr5.push(300 + t);
				arr6.push(330 + t);
				arr7.push(360 + t);
				arr8.push(390 + t);
				arr9.push(420 + t);
				
				
				
				
			}
			
			
			arr10.push(arr1);
			arr10.push(arr2);
			arr10.push(arr3);
			arr10.push(arr4);
			arr10.push(arr5);
			arr10.push(arr6);
			arr10.push(arr7);
			arr10.push(arr8);
			arr10.push(arr9);
			BG.tileBoard(arr10);
			
			
			text.tileBoard(setText(myText));
			next.tileBoard(new Array([129]));
			
			
			text.x += 8;
			text.y += 8;
			next.y = 56;
			next.x = 224;
			
			
			
			
			
			
		}
		public function addNext():void
		{
			next = new SpriteSheet(new Assets.Font1, 8, 8);
			next.tileBoard(new Array([129]));
			
			addChild(next);
			next.y = 56;
			next.x = 224;
			stage.addEventListener(KeyboardEvent.KEY_UP, keypress, false, 0, true);
			next.addEventListener(MouseEvent.CLICK, clicked, false, 0, true);
		}
		public function keypress(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				removeNext();
				goNext();
				
			}
			
		}
		
		public function clicked(e:MouseEvent):void
		{
			removeNext();
			goNext();
			
			
		}
		public function goNext():void
		{
			trace("next");
			pos++;
			pageTurn.play();
			if (pos < myBook.getLength())
			{
				text.tileBoard(setText(myBook.getPage(pos)));
				addNext();
			}
			else
			{
				trace("noNext");
			
				// make event that signifies story is done.
			}
			
			
			
		}
		
		public function setText(myText:String):Array
		{
			var letters:Array = new Array();
			var hold2:Array = new Array();
			var count:int = 0;
			var hold:Array = new Array();
			
			for (var i:int = 0; i < myText.length; i++ )
			{
				
				
				count++;
				if ('A'.charCodeAt(0) <= myText.charCodeAt(i) && myText.charCodeAt(i)<= 'M'.charCodeAt(0))
				{
					
					letters.push((myText.charCodeAt(i)-'A'.charCodeAt(0))*2);
					hold2.push((myText.charCodeAt(i)-'A'.charCodeAt(0))*2+30);
					
				}
				else if ('N'.charCodeAt(0) <= myText.charCodeAt(i) && myText.charCodeAt(i) <= 'Z'.charCodeAt(0))
				{
					letters.push((myText.charCodeAt(i)-'N'.charCodeAt(0))*2+60);
					hold2.push((myText.charCodeAt(i)-'N'.charCodeAt(0))*2+90);
					
				}
				else if ('a'.charCodeAt(0)<= myText.charCodeAt(i) && myText.charCodeAt(i) <= 'm'.charCodeAt(0))
				{
					letters.push(((myText.charCodeAt(i)-'a'.charCodeAt(0))*2)+1);
					hold2.push(((myText.charCodeAt(i)-'a'.charCodeAt(0))*2)+31);
					
				}				
				else if ('n'.charCodeAt(0) <= myText.charCodeAt(i) && myText.charCodeAt(i) <= 'z'.charCodeAt(0))
				{
					letters.push(((myText.charCodeAt(i)-'n'.charCodeAt(0))*2)+61);	
					hold2.push(((myText.charCodeAt(i)-'n'.charCodeAt(0))*2)+91)
				}
				
				
				
				//hardcode the remaining symbols
				if (myText.charAt(i) == " ")
				{
					
					letters.push(26);
					hold2.push(26);
				}
				if (myText.charAt(i) == "0")
				{
					letters.push(27);
					hold2.push(26);
				}
				if (myText.charAt(i) == "1")
				{
					letters.push(28);
					hold2.push(26);
				}
				if (myText.charAt(i) == "2")
				{
					letters.push(29);
					hold2.push(26);
				}
				if (myText.charAt(i) == "3")
				{
					letters.push(57);
					hold2.push(26);
				}
				if (myText.charAt(i) == "4")
				{
					letters.push(58);
					hold2.push(26);
				}
				if (myText.charAt(i) == "5")
				{
					letters.push(59);
					hold2.push(26);
				}
				if (myText.charAt(i) == "6")
				{
					letters.push(87);
					hold2.push(26);
				}
				if (myText.charAt(i) == "7")
				{
					letters.push(88);
					hold2.push(26);
				}
				if (myText.charAt(i) == "8")
				{
					letters.push(89);
					hold2.push(26);
				}
				if (myText.charAt(i) == "9")
				{
					letters.push(118);
					hold2.push(26);
				}
				
				if (myText.charAt(i) == ".")
				{
					letters.push(120);
					hold2.push(26);
				}
				if (myText.charAt(i) == ",")
				{
					letters.push(121);
					hold2.push(151);
				}
				if (myText.charAt(i) == "!")
				{
					letters.push(122);
					hold2.push(26);
				}
				
				if (myText.charAt(i) == "?")
				{
					letters.push(124);
					hold2.push(26);
				}
				if (myText.charAt(i) == "#")
				{
					letters.push(126);
					hold2.push(26);
				}
				if (myText.charAt(i) == "_")
				{
					letters.push(127);
					hold2.push(26);
				}
				if (myText.charAt(i) == "-")
				{
					letters.push(128);
					hold2.push(26);
				}
				
				if (myText.charAt(i) == ":")
				{
					letters.push(130);
					hold2.push(26);
				}
				if (myText.charAt(i) == ";")
				{
					letters.push(131);
					hold2.push(161);
				}
				if (myText.charAt(i) == "\'")
				{
					letters.push(132);
					hold2.push(26);
				}
				if (myText.charAt(i) == "\"")
				{
					letters.push(133);
					hold2.push(26);
				}
						
				if (count >= MAXLETTERS)
				{
					count = 0;
					hold.push(letters);
					hold.push(hold2);
					letters = new Array();
					hold2 = new Array();
				}
				
			}
			
			
			if (count < MAXLETTERS)
			{
				for (var i:int = 0; i < MAXLETTERS - count; i++ )
				{
					letters.push(26);
					hold2.push(26);
					
				}
				
			}
			hold.push(letters);
			hold.push(hold2);
			
	
			return hold;
		}
		
		public function addPage(page:String,pos:int=200):void
		{
			myBook.addPage(page, pos);
			
		}
		public function removeNext():void
		{
			stage.removeEventListener(KeyboardEvent.KEY_UP,keypress);
			next.removeEventListener(MouseEvent.CLICK, clicked);
			removeChild(next);
		}
	}
	
}