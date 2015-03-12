package 
{


	public class LevelElements
	{


		var levelTime:Array = new Array();
		var numberOfElementsToSpawn:Array = new Array();
		var typeOfElement:Array = new Array();
		var xDistance:Array = new Array();
		var yDistance:Array = new Array();

		public var enemies:Array = new Array(levelTime,numberOfElementsToSpawn,typeOfElement,xDistance,yDistance);

		public function LevelElements()
		{

			initialise();

		}

		function initialise():void
		{
			
			for (var i:int =0; i < 180; i++)
			{
				//Level Time (second)
				enemies[0][i] = i;
				//trace(enemies[0][i]);
				
				//Type of enemy in wave
				enemies[1][i]= Math.floor(Math.random() * (4 + 1));
				//trace(enemies[1][i]);
				
				//Number of enemies in wave
				enemies[2][i] = Math.floor(Math.random() * (6 + 1));
				//trace(enemies[0][i]);
				
				//X distance from previous element
				enemies[3][i] = 0;
				
				//X distance from previous element
				enemies[4][i] = 20;


			}

		}

	}

}