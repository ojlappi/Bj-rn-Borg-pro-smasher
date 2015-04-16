package  
{
	import org.flixel.FlxGroup;
	import org.flixel.plugin.photonstorm.FlxLinkedGroup;
	import sprite.Player;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Registry 
	{
		public static var player:Player;
		public static var projectiles:FlxGroup = new FlxGroup;
		public static var npcs:FlxGroup = new FlxGroup;
		public static var enemies:FlxGroup = new FlxGroup;
		public static var collidableEnemies:FlxGroup = new FlxGroup;
		public static var selfcollidingGroup:FlxGroup = new FlxGroup;
		public static var topLayer:FlxGroup = new FlxGroup;
		public function Registry() 
		{
			
		}
		
	}

}