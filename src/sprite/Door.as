package sprite {
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Door extends FlxSprite
	{
		private var id:int;
		public function Door(X:Number, Y:Number ){
		super(X, Y);
		immovable = true;
			
		}
		
	}

}