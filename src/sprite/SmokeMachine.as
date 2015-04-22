package sprite 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Lappi
	 */
	public class SmokeMachine extends FlxSprite 
	{
		private var count:int=0;
		[Embed(source = "../sprite/assets/Chimney.png")] private var smokePNG:Class;
		public function SmokeMachine(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(smokePNG, true, true, 30, 60, false);	
		}
		override public function update():void {
			count++;
			if(count==10){
			for (var i:int = 0; i < 11; i++){
			var part:SmokePart = new SmokePart(x + 2 * i , y + 4);
			/*for (var i:int = 0; i < 16; i++){
			var part:SmokePart = new SmokePart(x + 1.35*i , y+4);*/
			
			part.velocity.y = -10;
			
			Registry.smokeLayer.add(part);
			}
			count = 0;
			}
		}
		
	}

}