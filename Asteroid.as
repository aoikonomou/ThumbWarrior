package 
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class Asteroid extends MovieClip
	{
		var speed:int = fl_GenerateRandomNumber(2)+1;

		public function Asteroid():void
		{
			// constructor code

			initialise();
			//Add event listener to this symbol
			this.addEventListener(Event.ENTER_FRAME, Level.gameAnimator.updateAsteroids);

		}

		public function initialise():void
		{
			this.x = fl_GenerateRandomNumber(600);
			this.y = -100;
			
			//register asteroids for collision detection.

		}

		function fl_GenerateRandomNumber(limit:Number):int
		{
			var randomNumber:int = Math.floor(Math.random() * (limit + 1));
			return randomNumber;
		}

	}

}