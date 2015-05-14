package level 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxTileblock;
	import sprite.BigDoor;
	import sprite.Door;
	import sprite.FloatingBall;
	import sprite.Tower;
	/**
	 * ...
	 * @author ...
	 */
	public class TowerRoom extends Level 
	{
		
		public function TowerRoom() 
		{
			
			bg.add(new BigDoor(700, 340,0,0));
			bg.add(new Tower(20, 151));
			bg.add(new FloatingBall(19, 80));
			var floor:FlxTileblock = new FlxTileblock(1, 400, 800,1);
			add(floor);
			width = 800;
			height = 400;
			
			
		}
	
		
	}

}