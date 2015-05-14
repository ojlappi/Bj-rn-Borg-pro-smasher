package  
{
	import level.*;
	import org.flixel.*;
	import sprite.*

	public class PlayState extends FlxState
	{
		public var rooms:Array;
		public function PlayState(){
		}
		override public function create():void{
			FlxG.bgColor = 0xff144954;	
			
			Registry.playstate = this;
			rooms = [new TestLevel,new DesertLevel, new UFOLevel,new TenniscourtsLevel,new TowerRoom];
			Registry.room = rooms[0];
			
		
			
			Registry.player = new Player(40, Registry.room.height - 40);
			
			//make spritegroups appear
			add(Registry.smokeLayer);
			add(Registry.backgroundLayer);
			add(Registry.effects);
			add(Registry.projectiles)
			add(Registry.npcs);
			add(Registry.enemies);
			add(Registry.player);
			add(Registry.room);
			
			
			add(new Ufo(0, 0, this));
			
			
			//TEST STUFF
			
			Registry.npcs.add(new Cat(40, 40));

			
			
			//END TEST STUFF
			
			
			FlxG.camera.setBounds(0, 0,Registry.room.width, Registry.room.height);
			FlxG.camera.follow(Registry.player, FlxCamera.STYLE_PLATFORMER);
			FlxG.worldBounds.make(Registry.room.width, Registry.room.height);
			
			FlxG.watch(	Registry.player.acceleration, "x", "ax");
			FlxG.watch(	Registry.player.velocity, "x", "vx");
			FlxG.watch(	Registry.player.velocity, "y", "vy");
			FlxG.watch(	Registry.room, "entryIndex", "entry");
			Registry.room.init();
			
		}
		
		override public function update():void{
			super.update();
			
			FlxG.collide(Registry.player, Registry.room);
		
			FlxG.collide(Registry.projectiles, Registry.room);
			FlxG.collide(Registry.npcs, Registry.room);
			FlxG.collide(Registry.enemies, Registry.room);
		
			
			
			
				if (FlxG.overlap(Registry.enemies, Registry.player)) 
					Registry.player.state.hurt();
					
			
					
			//DEBUG STUFf
			if (FlxG.keys.justPressed("B")) {
				var miss:Missile = new Missile(Registry.player.x, 0,new FlxPoint(50,400));
				
				Registry.backgroundLayer.add(miss)
				
			
			}
			if (FlxG.keys.ONE){
				Registry.npcs.add(new Cat(Math.floor(Math.random() * 80)+Registry.player.x,40));
			}
			
			if (FlxG.keys.justPressed("TWO")) {
				var boss:BossBall = new BossBall(Registry.player.x, 40);
				Registry.enemies.add(boss);
			}
			if (FlxG.keys.justPressed("THREE")) {
				var statue:TennisStatue = new TennisStatue(Registry.player.x, Registry.player.y-10,Registry.player.facing);
				Registry.npcs.add(statue);
			}
			if (FlxG.keys.FOUR&&FlxG.keys.justPressed("FOUR")) {
				Registry.enemies.add(new TennisMachine(Registry.player.x, 40));
			}
			if (FlxG.keys.FIVE&&FlxG.keys.justPressed("FIVE")) {
				Registry.enemies.add(new Dude(Registry.player.x, 40));
			}
			if (FlxG.keys.SIX&&FlxG.keys.justPressed("SIX")) {
				Registry.backgroundLayer.add(new SmokeMachine(Registry.player.x, Registry.player.y-60 ));
			}
			if (FlxG.keys.SEVEN&&FlxG.keys.justPressed("SEVEN")) {
				Registry.projectiles.add(new Meteorite(Registry.player.x, 1,50,100,false ));
			}
				if (FlxG.keys.G&&FlxG.keys.justPressed("G")) {
				Registry.projectiles.add(new Closet(Registry.player.x, 40));
			}
				if (FlxG.keys.EIGHT&&FlxG.keys.justPressed("EIGHT")){
				loadRoom(4,0);
			}
				if (FlxG.keys.Q&&FlxG.keys.justPressed("Q")){
				loadRoom(0,0);
			}
			if (FlxG.keys.NINE&&FlxG.keys.justPressed("NINE")){
				Registry.projectiles.add(new HomingMeteorite(Registry.player.x, 1,50,100,false ));
			}	
			if (FlxG.keys.justPressed("Z")) {
			Registry.player.state.tryToSwing();
			
			}
			if (FlxG.keys.justPressed("X")) {
				var sign:int = (Registry.player.facing==FlxObject.LEFT?-1:1);
			Registry.projectiles.add(new Ball(Registry.player.getMidpoint().x+sign*15,Registry.player.y,100*sign,0));
			
			}
			
		
		}
		public function loadRoom(roomIndex:int, entryIndex:int):void {
			var oldRoom:FlxGroup = Registry.room;
			Registry.room = rooms[roomIndex];
			Registry.backgroundLayer.clear();
			Registry.collidableEnemies.clear();
			Registry.effects.clear();
			Registry.enemies.clear();
			Registry.npcs.clear();
			Registry.projectiles.clear();
			Registry.smokeLayer.clear();
			
			remove(oldRoom);
			
			add(Registry.room);
			Registry.room.init();
			Registry.room.setplayer(entryIndex);
			FlxG.camera.setBounds(0, 0,Registry.room.width, Registry.room.height);
			FlxG.camera.follow(Registry.player, FlxCamera.STYLE_PLATFORMER);
			FlxG.worldBounds.make(Registry.room.width, Registry.room.height);

		}
	}
}
