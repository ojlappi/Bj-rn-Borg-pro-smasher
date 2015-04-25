package sprite 
{
	/**
	 * ...
	 * @author ...
	 */
	public class Meteorite extends Projectile
	{
		
			//[Embed(source = "../sprite/assets/tennisguy.png")] private var ballPNG:Class;
			[Embed(source = "../sprite/assets/MeteoriteA.png")] private var ballPNG:Class;
		
		protected var isEffect:Boolean = false;

		private var counter:Number=0;
		private var father:Meteorite;
		private var lastFX:Meteorite;
		public function Meteorite(X:Number,Y:Number,velocityX:int,velocityY:int,isEffect:Boolean) 
		{
			lastFX = this;
				super(X, Y);
				this.isEffect = isEffect;
			
			loadGraphic(ballPNG, false, true, 15, 15, false);
			//loadGraphic(ballPNG, false, true, 30, 21,false);
			elasticity = 0.8;
			//addAnimation("fade", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 3 , true);	
			addAnimation("fade", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,16,17,18,19,20,21,22,23,24,25,26,27,27,27,27,28,28,29],20 ,false);	
			velocity.x = velocityX;
			velocity.y = velocityY;
			angle
			
		}
			override public function update():void {
				if (isEffect) {
					if (_curFrame == 13)
					kill();
				counter++;
				play("fade");
				var rand:Number = (Math.random() * 20 - 10 ) / 3;
				velocity.y -= rand;
				velocity.x += (Math.random() * 20 - 10) / 3;
				if(rand>0){
				angle -= father.angle/counter;
				father.angle += angle/counter;
				}
				}else {
					if (y < -8)
					kill();
					
				var fadeFX:Meteorite = new Meteorite(x, y, 0, 0, true);
				Registry.effects.add(fadeFX);
				fadeFX.angle = Math.atan(velocity.y / velocity.x) * 360 / (2 * Math.PI);
				fadeFX.father = lastFX;
				lastFX = fadeFX;
					
				}
				
				
			}
		
	}

}