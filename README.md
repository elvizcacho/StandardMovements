# Drag and Drop for ActionScript 3.0

The StandardMovements class adds all the basic actions and movements to any object in the stage. It's the easiest and fastest way to add and use drag and drop actions in AS3. This class was used to develop more than 7 simulators of physics, chemistry and biology for an e-learning company.

The class Standardmovements.as adds 'drag and drop' to objects which extend from this class. The constructor of the super class only needs a MovieClip that is the object that is going to adquire the 'drag and drop' and another one which takes the place of an active zone (where the object is going to end up fixed.)

### Class description

* Public attributes 
  - **startPositionObjectX:Number** : initial x position of the object.
  - **startPositionObjectY:Number** : initial y position of the object.
  - **initIndex:uint** : initial index value of the object.
  - **isMoving:Boolean** : you read a *true* value if the object is being moved otherwise is *false*.
  - **stateObject:Boolean** : If this variable is true, the object remains in its active zone.
  - **initFrame:int** : the frame of the MovieClip in the initial position.
  - **endFrame:int** : the frame of the MovieClip when this one is fixed in the active zone.
  - **mouseOut:Boolean**: enable/disable the mouse out mode. If the moouse out mode is actived, when the mouse goes out to the object this return to its start position.

* Public methods
  - **StandardMovements**(targetObject, activeZone, initFrame, endFrame, mouseOut):void
    - *Contructor of the class.*
    - **targetObject:MovieClip** is the object in stage that you want to add basic moves to.
    - **activeZone:MovieClip** is the zone targetObject is going to be fixed to.
    - **initFrame:int = 1** is an optional parameter corresponding to the initial keyframe of the object.
    - **endFrame:int = 2** is an optional parameter that controls the frame which is set when the object is fixed to the active zone.
    - **mouseOut:Boolean = false** If this parameter is set true, when the mouse goes out of the targetObject, this one returns to startPosition.

  - **getObj**():MovieClip
    - *Gets the object you are adding moves and actions with this class.*

  - **getActiveZone**():MovieClip
    - *Gets the active zone where your object will remain.*

  - **setActiveZone**(activeZone:MovieClip):void
    - *Sets the active zone where your object will remain.*
    - **activeZone:MovieClip** your new active zone.

  - **goStartPosition**():void
    - *Object goes to the start position.*

  - **removeAllMouseEvents**():void
    - *Removes all mouseEvents that this class generates*

  - **enable()**:void
    *Enables the object when this one has been located in the active zone and sets stateObject to false.*

  - **stepTo**(newActiveZone:MovieClip,newInitFrame:int,newEndFrame:int):void{
    - *Changes the active zone for a new one and the current active zone becomes the new start position.*
    - **newActiveZone:MovieClip** new active zone.
    - **newInitFrame:int** new frame that is showed when the object is moving and remains in its new start position.
    - **newEndFrame:int** new frame that is showed when the object is set in its new active zone.


* Events
  
  - **fixed** event is triggered when the object is fixed at the active zone.

  ###### Sebastian Vizcaino
  elvizcacho@gmail.com