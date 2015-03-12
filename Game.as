package 
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import Level;
	import StartUpScreen;

	public class Game extends MovieClip
	{

		public var level:Level;
		public var StartScreen:StartUpScreen;

		public function Game()
		{

			// Show startup screen

			stage.addEventListener("gameStartButtonClicked", changeLevel);

			StartScreen = new StartUpScreen();
			stage.addChild(StartScreen);
			StartScreen.mouseEnabled = false;
			level = new Level(stage);

		}


		public function changeLevel(event:Event)
		{

			stage.removeChild(StartScreen);
			StartScreen = null;
			stage.addChild(level);

		}
	}
}