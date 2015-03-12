package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	//import Level;
	
	public class Bullet extends MovieClip {
		
		public var _this;
		
		public function Bullet(test):void {
			// constructor code
			
			_this=test;
			trace(_this);
			
			this.addEventListener(Event.ENTER_FRAME, Level.gameAnimator.updateBullets);
			
			//register bullets for collision detection
			
			
		}
		
		public function initialise():void
		{
			
			
			//var blah;
			//blah = Game._instance;
			
			
			this.x = _this.x;
			this.y = _this.y-80;
		
			}
		
	}
	
}
