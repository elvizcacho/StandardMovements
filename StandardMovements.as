
package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import fl.transitions.TweenEvent;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import flash.ui.Mouse;
	import flash.events.Event;
	
/**
* The StandardMovements class adds all the basic actions and movements to any object in the stage.
* It's the easiest and fastest way to add and use drag and drop actions.
* Download file: <a href="http://misscripts.uni.me/AS3/classes/StandardMovements.as">StandardMovements.as</a>
* @author  Juan Sebastian Vizcaíno Castro
* @version 1.0
* @since   2014-04-09
*/
	
	public class StandardMovements extends MovieClip{
		
		//**
		/*Represents the <b>x</b> starting position of the object
		*/
		public 	var startPositionObjectX:Number;
		//**
		/*Represents the <b>y</b> starting position of the object
		*/
		public 	var startPositionObjectY:Number;
		public 	var initIndex:uint;
		private var targetObject:MovieClip;
		private var activeZone:MovieClip;
		private var Tween2:Tween;
		private var flag:Boolean;
		public 	var isMoving:Boolean;
		private var Tween3:Tween;
		
		//**
		/*If this variable is true, the object remains in its active zone.
		*/
		public 	var stateObject:Boolean;
		//**
		/*Represents the frame in the start position.
		*/
		public 	var initFrame:int;
		//**
		/*Represents the frame in the active zone.
		*/
		public 	var	endFrame:int;
		//**
		/*Shows if the mouse out mode is actived. If so, when the mouse goes out to the object this return to its start position.
		*/
		protected var mouseOut:Boolean;
		
	/**
	* This is the contructor of the class
	* @param targetObject is the object in stage that you want to add basic moves to.
	* @param activeZone is the zone targetObject is going to be fixed to.
	* @param initFrame is an optional parameter corresponding to the starting keyframe of the object.
	* @param endFrame is an optional parameter that controls the frame which is set when the object is fixed to the active zone.
	* @param mouseOut If this parameter is set true, when the mouse goes out of the targetObject, this one returns to startPosition.
	*/
								
		public function StandardMovements(targetObject:MovieClip,activeZone:MovieClip,initFrame:int=1,endFrame:int=2,mouseOut:Boolean=false) {
		    this.targetObject=targetObject;
			this.startPositionObjectX=targetObject.x;
			this.startPositionObjectY=targetObject.y;
			this.activeZone=activeZone;
			this.targetObject.addEventListener(MouseEvent.MOUSE_DOWN,onDownTarjectObject);
			this.activeZone.alpha=0;
			this.initFrame=initFrame;
			this.endFrame=endFrame;
			this.stateObject=false;
			this.mouseOut=mouseOut;
			this.flag=false;
			this.targetObject.stop();
			this.initIndex=targetObject.parent.getChildIndex(targetObject);
			this.isMoving=false;
		}
		
	/**
   * Gets the object you are adding moves and actions with this class.
   * @return tarjetObject
   */
		
		public function getObj():MovieClip{
			return this.targetObject;
		}
	/**
   * Gets the active zone where your object will remain.
   * @return activeZone
   */
		public function getActiveZone():MovieClip{
			return this.activeZone;
		}
	/**
   * Sets the active zone where your object will remain.
   * @param activeZone your new active zone.
   */
		public function setActiveZone(activeZone:MovieClip){
			this.activeZone=activeZone;
		}
		
		protected function onMouseOutTarjectObject(e:MouseEvent):void{
			standardMouseOutFunction();
		}
		
		protected function onMoveTargetObject(e:MouseEvent):void{
			standardMouseMoveFunction();
		}
		
		protected function onDownTarjectObject(e:MouseEvent):void{
			standardMouseDownFunction();
		}
		
		protected function onUpTarjectObject(e:MouseEvent):void{
			standardMouseUpFunction();
		}
	
	/**
   * Object goes to the start position.
   * @param activeZone your new active zone.
   */
		public function goStartPosition():void{
			targetObject.gotoAndStop(initFrame);
			Tween3 = new Tween(targetObject,"x", Strong.easeOut, targetObject.x, startPositionObjectX, 1,true);
			Tween2Action(targetObject,"y",targetObject.y,startPositionObjectY,1);
			targetObject.gotoAndStop(initFrame);
		}
				
		private function Tween2Action(elemento:MovieClip, property:String, startPosition:Number, endPosition:Number, duration:Number):void {
			elemento=targetObject;
			Tween2 = new Tween(elemento,property, Strong.easeOut, startPosition, endPosition, duration,true);
			Tween2.addEventListener(TweenEvent.MOTION_FINISH, onTween2Finish);
		}
		
		private function onTween2Finish(e:TweenEvent):void{
			if(!stateObject){targetObject.addEventListener(MouseEvent.MOUSE_DOWN,onDownTarjectObject);}
			activeZone.alpha=0;
			this.targetObject.parent.setChildIndex(this.targetObject,this.initIndex);
		}
		
		/**
   * Removes all mouseEvent-type events that this class generates
   */
		
		public function removeAllMouseEvents():void{
			targetObject.removeEventListener(MouseEvent.MOUSE_DOWN,onDownTarjectObject);
			targetObject.removeEventListener(MouseEvent.MOUSE_UP,onUpTarjectObject);
			targetObject.removeEventListener(MouseEvent.MOUSE_MOVE,onMoveTargetObject);
			targetObject.removeEventListener(MouseEvent.MOUSE_OUT,onMouseOutTarjectObject);
		}
	/**
   * Enables the object when it's been located in the active zone and sets stateObject to true.
   */
		public function enable():void{
			stateObject=false;
			targetObject.addEventListener(MouseEvent.MOUSE_DOWN,onDownTarjectObject);
		}
	
	/**
   * Changes the active zone for a new one and the current active zone becomes the new start position.
   *@param newActiveZone new active zone.
   *@param newInitFrame new frame that is showed when the object is moving and remains in its new start position.
   *@param newEndFrame new frame that is showed when the object is set in its new active zone.
   */	
		public function stepTo(newActiveZone:MovieClip,newInitFrame:int,newEndFrame:int):void{
			this.startPositionObjectX=this.activeZone.x;
			this.startPositionObjectY=this.activeZone.y;
			this.activeZone=newActiveZone;
			this.initFrame=newInitFrame;
			this.endFrame=newEndFrame;
			enable();
		}
	/**
   * Executes the standard mouse up function. Stops stopDrag function, sets StateObject to true and removes the mouse events if the hitTestObject between the object and the active zone is true; else a goStartPosition function is executed.
   */
		protected function standardMouseUpFunction():void{
			this.isMoving=false;
			targetObject.removeEventListener(MouseEvent.MOUSE_UP,onUpTarjectObject);
			targetObject.removeEventListener(MouseEvent.MOUSE_MOVE,onMoveTargetObject);
			activeZone.alpha=0;
			targetObject.stopDrag();
			if(targetObject.hitTestObject(activeZone)){
				targetObject.gotoAndStop(endFrame);
				targetObject.x=activeZone.x;
				targetObject.y=activeZone.y;
				removeAllMouseEvents();
				this.stateObject=true;
				dispatchEvent(new Event("fixed", true));
				}
			else{
				goStartPosition();
				this.stateObject=false;
			}
			if(mouseOut){targetObject.removeEventListener(MouseEvent.MOUSE_OUT,onMouseOutTarjectObject);}
		}
		
		protected function standardMouseDownFunction():void{
			this.isMoving=false;
			targetObject.removeEventListener(MouseEvent.MOUSE_DOWN,onDownTarjectObject);
			targetObject.startDrag();
			targetObject.parent.setChildIndex(targetObject,targetObject.parent.numChildren-1);
			targetObject.addEventListener(MouseEvent.MOUSE_MOVE,onMoveTargetObject);
			targetObject.addEventListener(MouseEvent.MOUSE_UP,onUpTarjectObject,false,1);
			if(mouseOut){this.targetObject.addEventListener(MouseEvent.MOUSE_OUT,onMouseOutTarjectObject);}
		}
		
		protected function standardMouseMoveFunction():void{
			this.isMoving=true;
			if(activeZone.hitTestObject(targetObject)){
				activeZone.alpha=0.7;
			}
			else if(activeZone.alpha<0.7&&activeZone.alpha>0.699){
					new Tween(activeZone,"alpha",None.easeOut,activeZone.alpha,0,0.5,true);
			}
		}
		
		protected function standardMouseOutFunction():void{
			targetObject.stopDrag();
			goStartPosition();
			this.isMoving=false;
		}
		
	}
}

