package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Level extends FlxGroup
	{
		
		public var width:int;
		public var height:int;
		public var entries:FlxGroup;
		protected var bg:FlxGroup = new FlxGroup;
		public function Level(){	
		}
		public function init():void {
			Registry.backgroundLayer.add(bg);
			Registry.backgroundLayer.add(entries);
		}
		public function setplayer(entryIndex:int):void {
		var a:FlxPoint = (entries.members[entryIndex] as FlxSprite).getMidpoint();
			Registry.player.x = a.x;
			Registry.player.y = a.y;
		}	
	}
}