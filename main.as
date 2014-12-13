package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class main extends MovieClip {
		
		
		public function main() {
			this.square.addEventListener('fixed', onFixedSquare);
			this.reset_button.addEventListener(MouseEvent.CLICK, onClickResetButton);
		}
		
		private function onFixedSquare(e:Event):void{
			trace("The object has been placed");
		}
		
		private function onClickResetButton(e:MouseEvent):void{
			this.square.goStartPosition();
			this.square.enable();
		}
	}
	
}
