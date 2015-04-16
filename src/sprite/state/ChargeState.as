package sprite.state 
{
	import sprite.GameSprite;
	import org.flixel.FlxG;
	import sprite.Projectile;
	/**
	 * ...
	 * @author Lappi
	 */
	public class ChargeState implements State 
	{
		
		public var spr:GameSprite;
		private var counter:int;
		public function ChargeState(spr:GameSprite) 
		{
			if (!spr.isPlayer)
			spr.state = new SwingingState(spr);
			this.spr = spr;
			counter = 0;
			
			
		}
		
		/* INTERFACE sprite.state.State */
		
		public function animate():void 
		{
			for each(var obj:Projectile in Registry.projectiles.members){
				
				if (FlxG.overlap(spr, obj)) 
					hurt();
			}
			if (!FlxG.keys.Z)
				if (counter > 100)
					spr.state = new ChargedSwingState(spr);
				
				else
					spr.state = new SwingingState(spr);
			if (counter > 100)
				spr.play("maxCharge");
			else{
				counter++;
				spr.play("charge");
			}
		}
		
		public function tryToSwing():void 
		{
			
		}
		
		
		
		public function walk():void {
			 
	
		}
		public function jump():void {
			
			
			
		}
		public function hurt():void {
			spr.state=new HurtState(spr);
		}
		
	}

}