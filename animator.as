package 
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Sprite;

	import Asteroid;

	public class animator extends MovieClip
	{


		public var levelReference;
		public var levelReferenceEnemy;

		var centerScale = 100;
		var speed = 2;
		var range = 100;
		var angle = 1;

		var currentFrameCount:int;
		var currentTime:int;


		//Remember, you cannot pass parameters to the main function because it is executed first and nothing is passed to it at that stage. It works later but at the beggining you get an error message.;
		public function animator():void
		{


		}



		// Update the stage. This is the animator essentially;
		public function updateTiles(event:Event):void
		{
			// While the timer has not finisehd counting down to 0 do some stuff...
			if (event.target.parent.levelDuration - event.target.parent.fl_CountDownTimerInstance.currentCount > 0)
			{
				//stage.stageHeight won't work unless you interogate something that has been added to the stage already?
				if (event.target.y >= 1136)
				{
					//change absolute value to tile size
					event.target.y = event.target.y - 1136 - 71;
				}
				//event.target.y +=  6;
				event.target.y +=  event.target.scrollingSpeed;

			}
		}


		public function updateAsteroids(event:Event):void
		{
			//var bul:Sprite = Sprite(event.target);
			if (event.target.y >= 1136)
			{

				event.target.removeEventListener(Event.ENTER_FRAME, Level.gameAnimator.updateAsteroids);
				levelReference.clreaItOut(event.target);

			}


			event.target.y +=  event.target.speed;
			//event.target.x +=  5;

			//event.target.x = event.target.centerScale + Math.sin(event.target.angle) * event.target.range;
			//event.target.angle +=  event.target.speed / 36;


			event.target.rotation +=  0.03 * 180 / Math.PI;// angle * 180/ Math.PI;




		}

		public function updateBullets(event:Event):void
		{

			var bul:Sprite = Sprite(event.target);

			if (bul.y < 100)
			{
				bul.removeEventListener(Event.ENTER_FRAME, Level.gameAnimator.updateBullets);
				bul.stage.removeChild(bul);
			}

			//if (event.target.y < 100)
			//{
			////change absolute value to tile size
			//event.target.removeEventListener(Event.ENTER_FRAME, Level.gameAnimator.updateBullets);
			//stage.removeChild(event.target);
			//trace(event.target);//=null;
			//
			//}

			event.target.y -=  5;

		}


		public function passAsteroidReference(levelReference1)
		{
			levelReference = levelReference1;

		}

		public function passmyEnemyReference(levelReference1)
		{
			levelReferenceEnemy = levelReference1;

		}


		public function updateEnemies(event:Event):void
		{


			if (event.target.y >= 1136)
			{


				event.target.removeEventListener(Event.ENTER_FRAME, Level.gameAnimator.updateEnemies);
				//event.target =null;

				levelReferenceEnemy.clreaItOut(event.target);

			}


			event.target.y +=  event.target.speed * 1;
			event.target.x +=  Math.sin(event.target.y) * 50;

			event.target.x = event.target.centerScale + Math.sin(event.target.angle) * event.target.range;
			event.target.angle +=  event.target.speed / 36;

			// Circular Motion function

			var circularMotion = false;
			if (circularMotion)
			{
				// Get these variables somewhere outside of here (or do something to that effect) otherwise thew 'll be resetting all the time and it wont work
				var radians = 0;
				var degrees = 0;
				//var pos_x = random(300);// random primary x position
				//var pos_y = random(300);// random primary y position
				var radius = 100;


				degrees = degrees + 5;// each time degrees is increased by 5 degrees
				radians = degrees * Math.PI / 180;
				//trace(radians);
				//new_y = Math.sin(radians) * radius;// because sin A = y/r
				//new_x = Math.cos(radians) * radius;// because cos A = x/r
				//this._x = new_x + pos_x;
				//this._y = new_y + pos_y;

			}

		}
	}
}