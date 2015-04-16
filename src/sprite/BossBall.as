package sprite 
{
	/**
	 * ...
	 * @author Lappi
	 */
	
	import org.flixel.FlxSprite;
	import sprite.strategy.*;
	import sprite.state.*;
	public class BossBall extends GameSprite
	{
		public var shadow:GameSprite;
		[Embed(source = "../sprite/assets/BossAlt.png")] private var bossPNG:Class;
		
		public function BossBall(X:Number,Y:Number) 
		{
			super(X, Y);
			loadGraphic(bossPNG,true, true,40,40,false);
			addAnimation("idle", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 15, true);		
			addAnimation("reverse", [0, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1], 15, true);
			
			
			
			acceleration.y = 200;
			
			drag.x = 1.3;
			maxVelocity.x = 200;
			maxVelocity.y = 200;
			elasticity = 1;
			weight = 2;
			strategy = new BossStrategy(this);
			state = new BossIdleState(this);
			
			
		}
		
	}

}