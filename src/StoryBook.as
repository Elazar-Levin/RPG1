package 
{
	
	/**
	 * ...
	 * @author Lazi
	 */
	public class StoryBook 
	{
		private var pages:Array;
		public function StoryBook(stories:Array=null)
		{
			if (stories != null)
			{
				pages = stories;
			}
			else
			{
				pages = new Array();
			}
			
		}
		public function getPage(i:int):String
		{
			return pages[i];
			
			
		}
		public function addPage(page:String,pos:int=200):void
		{
			if (pos == 200)
			{
				pages.push(page);
				
			}
			else if(pos<pages.length)
			{
				
				pages.insertAt(pos,page);
			}
			else
			{
				trace("out of bounds");
			}
		}
		public function getLength():int
		{
			return pages.length;
			
		}
		
		
	}
	
}