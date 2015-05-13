package sprite 
{
	/**
	 * ...
	 * @author ...
	 */
	public class BigDoor extends Door 
	{
		[Embed(source = "../sprite/assets/Door.png")] private var doorPNG:Class;
		public function BigDoor(X:Number,Y:Number) 
		{
			super(X, Y,0,0);
			loadGraphic(doorPNG, false,false, 91, 60,false);
			
		}
		
	}

}