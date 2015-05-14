package sprite {
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Door extends FlxSprite
	{
		protected var roomIndex:int;
		protected var entryIndex:int;
		//doorID,roomId är id på destinationen
		protected  var playstate:PlayState;
		
		public function Door(X:Number, Y:Number, roomIndex:int, entryIndex:int) {
			
			playstate = Registry.playstate;
			super(X, Y);
			immovable = true;
			this.roomIndex = roomIndex;
			this.entryIndex = entryIndex;
		}
		
		override public function update():void {
			if (FlxG.keys.DOWN && overlaps(Registry.player)){
				playstate.loadRoom(roomIndex, entryIndex);
			}
		}
	}

}