package sprite.state 
{
	/**
	 * ...
	 * @author Lappi
	 */
	import sprite.BossBall;
	import org.flixel.*;
	public class BossIdleState implements State 
	{
			private var spr:BossBall;
			private var reverse:Boolean=false;
		public function BossIdleState(spr:BossBall) 
		{
			this.spr = spr;
			
		}
		
		/* INTERFACE sprite.state.State */
		
		public function animate():void 
		{
			spr.angularVelocity = spr.velocity.x;
			if (spr.touching == FlxObject.FLOOR)
			reverse = !reverse;
			
			if (reverse)
				spr.play("reverse");
			else
				spr.play("idle");
			
				
		
		}
		
		public function tryToSwing():void 
		{
			
		}
		
	
		public function hurt():void 
		{
			
		}
		
		public function walk():void 
		{
			
		}
		
		public function jump():void 
		{
			
		}
		
		
	}

}