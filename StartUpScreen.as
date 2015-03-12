package  {
	
	import flash.display.MovieClip;
	import StartUpScreen.StartButton;
	
	public class StartUpScreen extends MovieClip {
		
		
		public function StartUpScreen() {
			// constructor code
			
			var _startButton = new StartButton();
			_startButton.x =200;
			_startButton.y =800;
			//this.mouseEnabled =false;
			addChild(_startButton);
			trace("sus");
			trace(_startButton.andreas);
			trace(_startButton);
			
			
		}
	}
	
}
