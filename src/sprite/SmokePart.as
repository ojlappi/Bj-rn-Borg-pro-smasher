package sprite 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Lappi
	 */
	public class SmokePart  extends FlxSprite
	{
		private var count:int = 0;
		[Embed(source = "../sprite/assets/Smoke.png")] private var smokePNG:Class;
		public function SmokePart(X:Number, Y:Number)
		{
		super(X, Y);
		loadGraphic(smokePNG, true, true, 10, 10, false);
	
		addAnimation("idle", [1], 0, false);
		addAnimation("second", [0], 0, false);
		
		
		}
		override public function update():void {
			if (y < 0)
			kill();
			
			count++;
			if (count == 19) {
				x += (Math.random() * 20 - 10)/7;
			randomFrame();
			count = 0;
			}
		}
		
	}

}