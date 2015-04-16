package sprite 
{
	/**
	 * ...
	 * @author Lappi
	 */
	public class Pupil extends GameSprite
	{
		
		[Embed(source = "../sprite/assets/Pupil.png")] private var pupilPNG:Class;
		public function Pupil(X:Number,Y:Number) {
			super(X, Y);
			loadGraphic(pupilPNG, false, true, 5, 5, false);
			width = 0;
			height = 0;
		}
		
	}

}