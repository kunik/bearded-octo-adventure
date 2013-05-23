package {
import citrus.core.starling.StarlingState;

import dragonBones.Armature;
import dragonBones.factorys.StarlingFactory;

import starling.core.Starling;

import starling.display.Sprite;
import starling.events.ResizeEvent;
import flash.events.Event;

public class GameState extends StarlingState {
  [Embed(source = "../assets/Robot.png", mimeType = "application/octet-stream")]
  public static const ResourcesData:Class;

  private static const resizable:Boolean = true;
  private static const maxWidth:uint = 800;
  private static const characterWidth:uint = 180;
  private static const characterHeight:uint = 230;
  private static const characterType:Class = Robot;
  private static const characterArmatureName:String = "robot";

  private var factory:StarlingFactory;

  override public function initialize():void {
    super.initialize();
    loadResources();
    bindListeners();
  }

  protected function displayCharacters():void {
    var movementList:Vector.<String> = factory.buildArmature(characterArmatureName).animation.animationData.movementList;
    var countInRow:Number = maxWidth / characterWidth;
    var x:uint = 0;
    var y:uint = 0;

    movementList.forEach(function(animationName, id, _):void {
      var character:Character = createCharacter(id);

      character.y = Number(characterHeight * (y + 0.5));
      character.x = Number(characterWidth * (x + 0.5));
      add(character);

      character.startMotion(animationName);

      x++;
      if (x > countInRow) {
        x = 0;
        y++;
      }
    });
  }

  protected function createCharacter(id:uint):Character {
    var characterArmature:Armature = factory.buildArmature(characterArmatureName);
    (characterArmature.display as Sprite).scaleY = 0.5;
    (characterArmature.display as Sprite).scaleX = -0.5;

    var character:Character = Character(new characterType("character" + id, { view: characterArmature }));
    return character;
  }

  protected function textureLoadedHandler(evt:Event):void {
    factory.removeEventListener(Event.COMPLETE, textureLoadedHandler);

    displayCharacters();
  }

  private function loadResources():void {
    factory = new StarlingFactory();
    factory.addEventListener(Event.COMPLETE, textureLoadedHandler);
    factory.parseData(new ResourcesData());
  }

  private function bindListeners():void {
    stage.addEventListener(ResizeEvent.RESIZE, handleStageResize);
  }

  private function handleStageResize(event:ResizeEvent):void {
    stage.stageWidth = event.width;
    stage.stageHeight = event.height;
    Starling.current.viewPort.width = event.width;
    Starling.current.viewPort.height = event.height;
  }
}
}