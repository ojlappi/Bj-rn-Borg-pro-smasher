package sprite 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxObject;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author ...
	 */
	public class Rosedoor extends FlxGroup 
	{
		[Embed(source = "../sprite/assets/BigPetal.png")] private var bigPNG:Class;
		[Embed(source = "../sprite/assets/MedPetal.png")] private var medPNG:Class;
		[Embed(source = "../sprite/assets/SmallPetal.png")] private var smallPNG:Class;
		[Embed(source = "../sprite/assets/XSPetal.png")] private var xsPNG:Class;
		private var bigs:FlxGroup = new FlxGroup;
		private var meds:FlxGroup = new FlxGroup;
		private var smalls:FlxGroup = new FlxGroup;
		private var xs:FlxGroup = new FlxGroup;
		private var counter:int = 0;
		private var open:Boolean = false;
		
		public function Rosedoor(X:Number,Y:Number) 
		{
			super();
			
			add(xs);
			add(smalls);
			add(meds);
			add(bigs); 
			bigs.add(new BigPetal(X, Y, bigPNG, this, FlxObject.RIGHT, 180));
			bigs.add(new BigPetal(X, Y, bigPNG,this, FlxObject.LEFT));
			bigs.add(new BigPetal(X - 60, Y, bigPNG, this));
			bigs.add(new BigPetal(X - 60, Y, bigPNG, this,FlxObject.LEFT,180));
			
			
			meds.add(new MedPetal(X , Y+41, medPNG,this, FlxObject.RIGHT,180));
			meds.add(new MedPetal(X-28, Y+41, medPNG,this));
			smalls.add(new SmallPetal(X , Y+53, smallPNG,this, FlxObject.RIGHT,180));
			smalls.add(new SmallPetal(X-18, Y+53, smallPNG,this));
			xs.add(new XSPetal(X, Y+56, xsPNG,this, FlxObject.RIGHT,180));
			xs.add(new XSPetal(X-12, Y+56, xsPNG,this));
			
			
		}public function openNext(order:int):void {
			switch(order){
				case 0: {
					meds.members[0].turn(1,1);
					meds.members[1].turn( 1,1);
				}
				break;
				case 1: {
					smalls.members[0].turn(1,1);
					smalls.members[1].turn(1,1);	
				}
				break;
				case 2: {
					xs.members[0].turn(1,1);
					xs.members[1].turn( 1,1); 
				}					
			}
		}
		override public function update():void {
		
			super.update();
			if (FlxG.keys.DOWN && open == false) {
				bigs.members[0].turn(1,1);
				bigs.members[1].turn( -1,-1);	
				bigs.members[2].turn( 1,1);	
				bigs.members[3].turn(- 1,-1);	
			}	
		}	
	}	
}
import org.flixel.FlxSprite;
import org.flixel.FlxObject;
import org.flixel.FlxPoint;
import sprite.Rosedoor;
class Petal extends FlxSprite {
	protected var rotation:Number=30;
	protected var radius:Number = 0;
	protected var completeR:Number;
	private var openingVelocity:Number;
	protected var time:Number = 1;
	
	protected var initialAngle:Number = 0;
	private var rd:Rosedoor;
	protected var order:int;
	private var cent:FlxPoint;
	private var turning:Boolean=false;
	function Petal(X:Number, Y:Number, rd:Rosedoor, angle:Number) {
		
		initialAngle = angle;
		super(X, Y);
		this.rd = rd;
	}
	public function turn(direction:Number,direction2:Number ):void {
		
		angularVelocity = direction*rotation / time;
		openingVelocity = direction2*completeR / (time*100);
		turning = true;
	}
	protected function makeCent():void {
			cent=new FlxPoint;
			cent.x = x;
			cent.y= getMidpoint().y;
	}
	override public function update():void {
		super.update();
		if (turning) {
			radius += openingVelocity;
			x = cent.x - Math.cos((angle) * Math.PI / 180) *radius;
			y = cent.y - height / 2 -Math.sin((angle) * Math.PI / 180) *radius;
		}
		if (turning&&Math.abs(angle-initialAngle) > rotation) {
			immovable = true;
			angularVelocity = 0;
		
			rd.openNext(order);
			turning = false;
		}
	}
	
}
class BigPetal extends Petal {
		[Embed(source = "../sprite/assets/BigPetal.png")] private var bigPNG:Class;
	
	function BigPetal(X:Number, Y:Number, img:Class,rd:Rosedoor, facing:uint = FlxObject.RIGHT,angle:Number=0) {
			
			super(X, Y,rd,angle);
			loadGraphic(img, false, true, 60, 135);
			order = 0;
			
			this.angle = angle;
			this.facing = facing;
			makeCent();
			completeR = 200;
		}
	
		
	}

	class MedPetal extends Petal {
			[Embed(source = "../sprite/assets/MedPetal.png")] private var medPNG:Class;
	
		public function MedPetal(X:Number, Y:Number, img:Class,rd:Rosedoor, facing:uint = FlxObject.RIGHT,angle:Number=0) {
			
			
			super(X, Y,rd,angle);
			
			order = 1;
			this.angle = angle;
			this.facing = facing;
			loadGraphic(img, false, true, 28, 54);
			makeCent();
			completeR = 150;
			rotation = 45;
		}
	}

	class SmallPetal extends Petal {
			[Embed(source = "../sprite/assets/SmallPetal.png")] private var smallPNG:Class;
		
		public function SmallPetal(X:Number, Y:Number, img:Class,rd:Rosedoor, facing:uint = FlxObject.RIGHT,angle:Number=0){	
			super(X, Y,rd,angle);
			order = 2;
			this.angle = angle;
			this.facing = facing;
			loadGraphic(img, false, true, 18, 29);
			makeCent();
			completeR = 125;
			rotation = 60;
		}
	}

	class XSPetal extends Petal {
		[Embed(source = "../sprite/assets/XSPetal.png")] private var xsPNG:Class;
		public function XSPetal(X:Number, Y:Number, img:Class,rd:Rosedoor, facing:uint = FlxObject.RIGHT,angle:Number=0){
			super(X, Y,rd,angle);
			order = 3;
			this.angle = angle;
			this.facing = facing;
			loadGraphic(img, false, true, 12, 23);
			makeCent();
			completeR = 100;
			rotation = 75;
		}
	}