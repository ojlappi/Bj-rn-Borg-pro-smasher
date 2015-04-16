package sprite 
{
	import org.flixel.FlxGroup;
	import sprite.state.BossIdleState;
	import sprite.state.IdleState;
	
	
	/**
	 * ...
	 * @author Lappi
	 */
	public class EyeBall extends GameSprite
	{
		private var group:FlxGroup;
	[Embed(source = "../sprite/assets/EyeLids.png")] private var lidsPNG:Class;
		public function EyeBall(X:Number,Y:Number) 
		{
			super(X, Y);
			loadGraphic(lidsPNG,true, true,19,19,false);
			group = new FlxGroup;
			group.add(new White(X, Y));
			group.add(new Pupil(X+7, Y+7));
			Registry.enemies.add(group);
			addAnimation("idle", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 10, true);
			
			state = new IdleState(this);
		}
		override public function update():void {
		
			
		}
		
	}

}