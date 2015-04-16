package sprite.strategy {
	/**
	 * ...
	 * @author Lappi
	 */
	import sprite.BossBall;
	public class BossStrategy implements Strategy 
	{
		private var spr:BossBall;
		public function BossStrategy(spr:BossBall) 
		{
			this.spr = spr;
		}
		
		/* INTERFACE sprite.strategy.Strategy */
		
		public function behave():void 
		{
			
		}
		
	}

}