package  
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Level extends FlxGroup
	{
		
		public var width:int;
		public var height:int;
		public var entries:Array;
		public function Level() 	{
			
		}
		public function init(entryIndex:int):void {
			//Registry.player.x = entries[entryIndex].x;
			//Registry.player.y = entries[entryIndex].y;
		}
		
	}

}