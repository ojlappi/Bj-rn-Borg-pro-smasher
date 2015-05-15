package level 
{
	import org.flixel.*;
	import sprite.SmallDoor;
	import sprite.TennisStatue;
	/**
	 * ...
	 * @author Lasse
	 */
	public class TennisTestLevel extends Level 
	{
		[Embed(source = "../level/assets/TennisTestSheet.png")]
		private var mapPNG:Class;
		
		[Embed(source = "../level/assets/TennisTest.csv",
		mimeType = "application/octet-stream")]
		public var mapCSV:Class; 
		
		private var map:FlxTilemap;
		public function TennisTestLevel() {
			super();
			
			entries = new FlxGroup;
			
			entries.add(new SmallDoor(40, 230, 0, 0));
			entries.add(new TennisStatue(500, 230, 1));
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapPNG, 20, 20, 0, 0, 1, 2);
			width = map.width;
			height = map.height;
			add(map);
			
		}
		
	}

}