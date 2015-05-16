package sprite 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Ball extends Projectile
	{
		[Embed(source = "../sprite/assets/Ball.png")] private var ballPNG:Class;
		private var speed:int;
		
		
		public function Ball(X:Number,Y:Number,velocityX:int,velocityY:int) {
			
			super(X, Y);
			
			loadGraphic(ballPNG, false, true, 2, 2, false);
			
			elasticity = 0.8;
			width = 2;
			height = 2;
			
			
			this.facing = facing;
			
			velocity.x = velocityX;
			velocity.y = velocityY;
			
		
		}
		
		
	}

}