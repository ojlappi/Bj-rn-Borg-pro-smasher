package sprite.state {
	import org.flixel.*;
	import sprite.GameSprite;
	import sprite.Projectile;
	/**
	 * ...
	 * @author Lappi
	 */
	public class ChargedSwingState implements State 
	{
		private var spr:GameSprite;
		private var counter:int;
		private var charge:int = 0;
		private var swinghitbox:FlxObject;
		public function ChargedSwingState(spr:GameSprite) 
		{
			swinghitbox = new FlxObject(spr.x-spr.offset.x,spr.y,25,15);
			this.spr = spr;
			counter = 20;
		}
		
		/* INTERFACE sprite.State */
		
		public function animate():void 
		{
			
			
			swinghitbox.x = spr.x - spr.offset.x;
			swinghitbox.y = spr.y;
			spr.play("swing");
			counter--;
			if (counter < 1) {
				
				
				spr.state = new IdleState(spr);
			}
			var sign:int = (spr.facing==FlxObject.LEFT?-1:1);
			for each(var obj:Projectile in Registry.projectiles.members){
				if (FlxG.overlap(swinghitbox, obj)) {
					if(sign*obj.x>sign*(spr.getMidpoint().x)){
						obj.velocity.x = sign* spr.strength*2;
						obj.acceleration.y = 0;
						obj.velocity.y = 0;
						break;	
					}
				}
				if (FlxG.overlap(spr, obj)) 
					hurt();
			}
			for each(var trg:GameSprite in spr.targets.members) {
				
				if (FlxG.overlap(swinghitbox, trg)) {
					if(sign*trg.x>sign*(spr.getMidpoint().x)){
						trg.velocity.x = sign* spr.strength/(trg.weight);
						trg.state.hurt();
						break;	
					}
				}
				
			}
		}
		public function tryToSwing():void {
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