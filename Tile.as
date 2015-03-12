package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.ColorTransform;

	public class Tile extends MovieClip
	{

		public var scrollingSpeed:int;


		//Remember, you cannot pass parameters to the main function because it is executed first and nothing is passed to it at that stage. It works later but at the beggining you get an error message.;
		public function Tile():void
		{

			//Add event listener to this symbol
			this.addEventListener(Event.ENTER_FRAME, Level.gameAnimator.updateTiles);

		}

		public function initialise(xpos,ypos,levelSpeed):void
		{
			this.x = xpos;
			this.y = ypos;
			//var scrollingSpeed:Number;
			scrollingSpeed = levelSpeed;


			//Randomly colorise object
			var obj_color:ColorTransform = new ColorTransform();

			// Blue shades
			var colors:Array = [0x06266F,0x2A4480,0x1240AB,0x4671D5,0x6C8CD5];

			// sets an object with colors for each button
			var set_colors:Object = {'red':0xff0000,'green':0x00ff00,'yellow':0xffff00,'blue':0x0000ff};
			obj_color.color = colors[fl_GenerateRandomNumber(colors.length - 4)];
			//this.transform.colorTransform = obj_color;
		}


		function fl_GenerateRandomNumber(limit:Number):Number
		{
			var randomNumber:Number = Math.floor(Math.random() * (limit + 1));
			return randomNumber;
		}

	}
}