package sprite.state {
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Lappi
	 */
	public class InvisibleState implements State 
	{
		private var spr:GameSprite;
		public function InvisibleState(spr:GameSprite) 
		{
		this.spr = spr;	
		}
		
		/* INTERFACE sprite.State */
		
		public function animate():void 
		{
		spr.play("invisible");	
		}
		
		public function walk():void {
			
		}
		public function jump():void {
			
		}
		public function hurt():void {
		
		}
	
	}

}