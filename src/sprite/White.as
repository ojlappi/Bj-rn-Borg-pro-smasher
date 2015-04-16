package sprite 
{
	/**
	 * ...
	 * @author Lappi
	 */
	public class White extends GameSprite 
	{
		[Embed(source = "../sprite/assets/White.png")] private var whitePNG:Class;
		public function White(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(whitePNG, true, true, 19, 19, false);
			
		}
		
	}

}