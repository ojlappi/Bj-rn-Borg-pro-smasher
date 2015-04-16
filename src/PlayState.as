package  
{
	import level.*;
	import org.flixel.*;
	import sprite.*

	public class PlayState extends FlxState
	{
		
	
		public var room:Level;
		public var rooms:Array;
		private var nextBall:int;
		public function PlayState() 
		{
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xff144954;	
			
			
			rooms = [new TestLevel,new DesertLevel, new UFOLevel,new TenniscourtsLevel];
			room = rooms[0];
			add(room);
			
			Registry.player = new Player(40, room.height - 40);
			
			//make spritegroups appear
			add(Registry.player);
			add(Registry.projectiles)
			add(Registry.npcs);
			add(Registry.collidableEnemies);
			add(Registry.enemies);
			add(Registry.selfcollidingGroup);
		
			add(new Ufo(0, 0, this));
			
			
			//TEST STUFF
			
			Registry.npcs.add(new Cat(40, 40));

			
			
			//END TEST STUFF
			
			
			FlxG.camera.setBounds(0, 0,room.width, room.height);
			FlxG.camera.follow(Registry.player, FlxCamera.STYLE_PLATFORMER);
			FlxG.worldBounds.make(room.width, room.height);
			
			FlxG.watch(	Registry.player.acceleration, "x", "ax");
			FlxG.watch(	Registry.player.velocity, "x", "vx");
			FlxG.watch(	Registry.player.velocity, "y", "vy");
			
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(Registry.player, room);
		
			FlxG.collide(Registry.projectiles, room);
			FlxG.collide(Registry.npcs, room);
			FlxG.collide(Registry.enemies, room);
			FlxG.collide(Registry.collidableEnemies, Registry.player);
			FlxG.collide(Registry.collidableEnemies, room);
			FlxG.collide(Registry.selfcollidingGroup,room);
			FlxG.collide(Registry.selfcollidingGroup,Registry.selfcollidingGroup);
			
			
			
				if (FlxG.overlap(Registry.enemies, Registry.player)) 
					Registry.player.state.hurt();
					
			
					
			//DEBUG STUFf
			if (FlxG.keys.ONE){
				Registry.npcs.add(new Cat(Math.floor(Math.random() * 80)+Registry.player.x,40));
			}
			
			if (FlxG.keys.justPressed("TWO")) {
				var boss:BossBall = new BossBall(Registry.player.x, 40);
				Registry.collidableEnemies.add(boss)
				
			
			}
			if (FlxG.keys.justPressed("THREE")) {
				var statue:TennisStatue = new TennisStatue(Registry.player.x, Registry.player.y-10,Registry.player.facing);
				
				Registry.npcs.add(statue)
				
			
			}
		
			if (FlxG.keys.FOUR&&FlxG.keys.justPressed("FOUR")) {
				
				Registry.collidableEnemies.add(new TennisMachine(Registry.player.x, 40));
				
			
			}
			if (FlxG.keys.FIVE&&FlxG.keys.justPressed("FIVE")) {
				
				Registry.enemies.add(new Dude(Registry.player.x, 40));
				
			
			}
			if (FlxG.keys.SIX&&FlxG.keys.justPressed("SIX")) {
				
				Registry.enemies.add(new EyeBall(Registry.player.x, 40));
				
			
			}
			
			
			if (FlxG.keys.SIX&&FlxG.keys.justPressed("SIX")) {
				
				Registry.enemies.add(new EyeBall(Registry.player.x, 40));
				
			
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
			var oldRoom:FlxGroup = room;
			room = rooms[roomIndex];
			remove(oldRoom);
			
			add(room);
			
			
			Registry.player.x = 10;
			Registry.player.y = 10;
			FlxG.camera.setBounds(0, 0,room.width, room.height);
			FlxG.camera.follow(Registry.player, FlxCamera.STYLE_PLATFORMER);
			FlxG.worldBounds.make(room.width, room.height);

		}
	}
}
