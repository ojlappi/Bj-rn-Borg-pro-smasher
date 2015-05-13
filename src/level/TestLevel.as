package level 
{
		import org.flixel.*;

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
		
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapPNG, 20, 20, 0, 0, 1, 1);
			width = map.width;
			height = map.height;
			add(map);
			
		}
		
	}

}