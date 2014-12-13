package  {
	import flash.display.MovieClip;
	import flash.utils.setTimeout;
	
	public class Square extends StandardMovements{ //We extends from Standardovements

		public function Square() {
			super(this,this);
			setTimeout(delay,0.1); //to wait for the activeZone exists in scenary
		}
				
		private function delay():void{
			setActiveZone(MovieClip(this.parent).activeZone);
			this.alpha=1;
			MovieClip(this.parent).activeZone.alpha = 0;
		}

	}
	
}
