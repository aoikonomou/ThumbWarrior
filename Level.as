//What does this class do? It creates the level. Which level? Currently the only one.

package 
{

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	import Utils;
	import LevelElements;
	import animator;
	import Tile;
	import Hero;
	import Bullet;
	import Asteroid;
	import Enemy;


	public class Level extends Sprite

	{

		public static var LevelReference:MovieClip;
		public var levelDuration:Number = 180;
		var CurrentLevelTime:int;
		var levelSpeed:int = 10;

		public var utilsObject:Utils = new Utils();
		public var levelElements:LevelElements = new LevelElements();
		public var fl_CountDownTimerInstance:Timer;
		public static var gameAnimator:animator = new animator();
		public var myHero2:Hero = new Hero();
		public var myAsteroid:Asteroid;
		public var myEnemy:Enemy;
		public static var txtboxTimeCounter:TextField = new TextField();


		public function Level(stage)
		{

			var _stage = stage;
			trace(_stage);

			createAnimator();
			createTiles();
			createHero();
			createTimer(levelDuration);
			createTimerGui();
		}

		function createTimerGui():void
		{

			//The line below must be done before adding text to the field

			var myFormat:TextFormat = new TextFormat();

			myFormat.bold = true;
			myFormat.size = 36;
			//myFormat.align = TextFormatAlign.CENTER;
			myFormat.color = 0xFFFFFF;

			txtboxTimeCounter.width = 200;
			txtboxTimeCounter.defaultTextFormat = myFormat;
			txtboxTimeCounter.x = 265;

			this.addChild(txtboxTimeCounter);

		}

		function createTimer(levelDuration):void
		{
			//Add event listener to timer object and start the timer
			fl_CountDownTimerInstance = new Timer(1000,levelDuration);
			fl_CountDownTimerInstance.addEventListener(TimerEvent.TIMER, fl_CountDownTimerHandler);
			fl_CountDownTimerInstance.start();

		}


		function fl_CountDownTimerHandler(event:Event):void
		{

			var a= utilsObject.convertToHHMMSS(levelDuration-fl_CountDownTimerInstance.currentCount);
			// Aparenly you cannot perform mathematical calculations at the argument on the textbox command
			//var a = levelDuration-fl_CountDownTimerInstance.currentCount;
			txtboxTimeCounter.text = "T: " + a;// Math.floor(a/60)+":"+(a+1)/Math.floor((a/60)+1);//- fl_CountDownTimerInstance.currentCount;
			//event.updateAfterEvent(); forces stage redraw
			CurrentLevelTime = fl_CountDownTimerInstance.currentCount;
			trace(CurrentLevelTime);
			createAsteroids();
			createEnemies();

		}


		public function createTiles():void
		{

			var xpos:int = 0;
			var ypos:int =  -  tileSize;
			var tileSize:int = 71;
			// Create a 17x9 grid of tiles. To cover the screen + one above for scrolling purposes
			for (var i:int =0; i<9; i++)
			{
				//var speed:Number = Math.floor(Math.random() * (10 + 10));

				for (var j:int =0; j<17; j++)
				{

					// Construct the new symbol;
					var sym:Tile = new Tile();
					sym.initialise(xpos,ypos,levelSpeed);
					this.addChild(sym);

					//Should improve performance but haven't tested it....
					sym.cacheAsBitmap;

					ypos +=  tileSize + 1;
				}
				xpos +=  tileSize + 1;
				ypos =  -  tileSize - 1;
			}

		}


		public function createAnimator():void
		{


		}

		function createHero():void
		{

			this.addChild(myHero2);

		}


		public function createAsteroids():void
		{


			if (levelElements.enemies[1][CurrentLevelTime] == 1)
			{

				for (var i:int =0; i<levelElements.enemies[2][CurrentLevelTime]; i++)
				{
					myAsteroid = new Asteroid();
					//myAsteroid.x +=  ;
					myAsteroid.y +=  10;
					this.addChild(myAsteroid);
					gameAnimator.passAsteroidReference(this);

				}
			}
		}

		public function clreaItOut(blah):void
		{

			this.removeChild(blah);
			blah = null;
		}


		public function createEnemies():void
		{

			if (levelElements.enemies[1][CurrentLevelTime] == 2){
			for (var j:int =0; j<levelElements.enemies[2][CurrentLevelTime]; j++)
			{
				myEnemy = new Enemy();
				myEnemy.y +=  10;
				this.addChild(myEnemy);
				gameAnimator.passmyEnemyReference(this);


			}
		}
		}
	}
}