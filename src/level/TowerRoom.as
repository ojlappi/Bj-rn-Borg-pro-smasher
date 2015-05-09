package level 
{
	import org.flixel.FlxG;
	import org.flixel.FlxTileblock;
	import sprite.BigDoor;
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
			
			
			width = 800;
		height = 400;
			
			
		}
		override public function init():void {
			Registry.backgroundLayer.add(new BigDoor(700, 340));
			Registry.backgroundLayer.add(new Tower(20, 151));
			Registry.backgroundLayer.add(new FloatingBall(19, 80));
			var floor:FlxTileblock = new FlxTileblock(1, 400, 800,1);
			//floor.makeGraphic(320, 32, 0xff689c16);
			//add(Registry.player);
			add(floor);
		}
		
	}

}