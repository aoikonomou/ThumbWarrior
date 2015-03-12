//Include all the sprite motion functions here

package 
{

	public class MotionFunctions
	{

		public function MotionFunctions()
		{
			// constructor code
		}



		public function SineWave(event:Event):void
		{

			if (event.target.y >= 1136)
			{
				//change absolute value to tile size
				event.target.y = -150;

				event.target.x = Math.floor(Math.random() * (500 + 1));

			}


			event.target.y +=  speed * 2;
			event.target.x +=  Math.sin(event.target.y) * 50;

			event.target.x = centerScale + Math.sin(angle) * range;
			angle +=  speed / 36;


			event.target.rotation +=  0.03 * 180 / Math.PI;// angle * 180/ Math.PI;

		}


		public function CircularMotion(event:Event):void
		{
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