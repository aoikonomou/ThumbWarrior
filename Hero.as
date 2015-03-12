package 
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import Bullet;


	public class Hero extends MovieClip
	{
		public var dragged:Boolean;
		public var bulletRate:int= 5;
		public var frameCounter:int =1;


		public function Hero()
		{

			initialise();

			// constructor code
			this.addEventListener(MouseEvent.MOUSE_DOWN, draghero);
			this.addEventListener(MouseEvent.MOUSE_UP, releasehero);
			this.addEventListener(Event.ENTER_FRAME, fire);

		}


		// Allow the spaceship to be dragged and fire on MOUSE_DOWN
		function draghero(event:MouseEvent):void
		{
			this.startDrag();

			dragged = true;
			//bulletTimer.start();
		}
		// Stop dragging spaceship and firing on MOUSE_UP;
		function releasehero(event:MouseEvent):void
		{
			this.stopDrag();
			dragged = false;
			//bulletTimer.stop();
		}


		function initialise():void
		{
			this.x = 330;
			this.y = 1100;
			
			// register ship for collision detection
			
			//_instance.addChild(this);


			//var a= RollingTiles.instance();
			//a.addChild(this);
			//To add an object to the front of the screen:
			//stage.setChildIndex(this, numChildren-1);

			//trace(stage);


			//To add an object to the back of the screen:
			//this.setChildIndex(objName, 0);

			//To swap the depths of two objects:
			//this.swapChildren(objA, objB);
			//Note this is expecting two DisplayObjects so you may have to do:
			//this.swapChildren(objA as DisplayObject, objB as DisplayObject);



		}


		public function fire(event:Event):void
		{
			frameCounter+=1;
			//trace(frameCounter);

			if (dragged == true && frameCounter > bulletRate)
			{
				var bullet:Bullet = new Bullet(this);
				bullet.initialise();
				this.stage.addChild(bullet);
				frameCounter =0;
			}


		}


	}

}