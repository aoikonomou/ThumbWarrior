package 
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class Enemy extends MovieClip
	{

		var centerScale = 200;
		var speed = 2;
		var range = 50;
		var angle = 1;

		public function Enemy()
		{

			initialise();
			//Add event listener to this symbol
			this.addEventListener(Event.ENTER_FRAME, Level.gameAnimator.updateEnemies);

		}


		public function initialise():void
		{
			//this.x = fl_GenerateRandomNumber(600);
			this.x = 10;
			this.y = 0;


			//register asteroids for collision detection.

		}

		function fl_GenerateRandomNumber(limit:Number):int
		{
			var randomNumber:int = Math.floor(Math.random() * (limit + 1));
			return randomNumber;
		}


	}

}