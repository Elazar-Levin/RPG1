package 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Lazi
	 */
	public class StatusBar extends Sprite  
	{
		addEventListener(Event.ADDED_TO_STAGE, go);
		addEventListener(Event.REMOVED_FROM_STAGE, die);
		
		public function go(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, go);
			
		}
		public function die(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, die);

			
		}
	}
	
}