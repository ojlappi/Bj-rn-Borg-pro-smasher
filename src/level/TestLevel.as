package level 
{
		import org.flixel.*;
		import sprite.SmallDoor;

	/**
	 * ...
	 * @author Lappi
	 */
	public class TestLevel extends Level 
	{
		[Embed(source = "../level/assets/UFOtiles.png")]
		private var mapPNG:Class;
		
		[Embed(source = "../level/assets/testlevel.csv",
		mimeType = "application/octet-stream")]
		public var mapCSV:Class; 
		
		private var map:FlxTilemap;
		public function TestLevel() 
		{
			entries = new FlxGroup;
			entries.add(new SmallDoor(40, 220, 0, 2));
			entries.add(new SmallDoor(100, 220, 0, 1));
			entries.add(new SmallDoor(200, 220, 4, 0));
		
			
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapPNG, 20, 20, 0, 0, 1, 1);
			width = map.width;
			height = map.height;
			add(map);
			
		}
		
	}

}