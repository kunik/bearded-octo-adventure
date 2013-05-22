package {
import citrus.core.starling.StarlingState;

import dragonBones.Armature;
import dragonBones.factorys.StarlingFactory;

import starling.display.Sprite;
import flash.events.Event;

public class GameState extends StarlingState {
  [Embed(source = "../assets/Robot.png", mimeType = "application/octet-stream")]
  public static const ResourcesData:Class;

  private var factory:StarlingFactory;
  private var character:Robot;

  override public function initialize():void {
    super.initialize();

    factory = new StarlingFactory();
    factory.addEventListener(Event.COMPLETE, textureCompleteHandler);
    factory.parseData(new ResourcesData());
  }

  protected function textureCompleteHandler(evt:Event):void {
    factory.removeEventListener(Event.COMPLETE, textureCompleteHandler);
    createCharacter();
  }

  protected function createCharacter():void {
    var armature:Armature = factory.buildArmature("robot");
    (armature.display as Sprite).scaleY = 0.5;
    (armature.display as Sprite).scaleX = -0.5;

    character = new Robot("character", {
      x: Math.floor(Math.random() * stage.stageWidth),
      y: Math.floor(Math.random() * stage.stageHeight),
      inverted: false,
      view: armature
    });
    add(character);

    character.startMoving();
  }

  override public function update(timeDelta:Number):void {
    super.update(timeDelta);

    if (character) {
      character.x += timeDelta * 100 * character.kx;
      character.y += timeDelta * 100 * character.ky;

      if (character.x >= stage.stageWidth) {
        character.inverted = true;
      } else if (character.x <= 0) {
        character.inverted = false;
      }

      if (character.y >= stage.stageHeight) {
        character.ky = -1;
      } else if (character.y <= 0) {
        character.ky = 1;
      }
    }
  }
}
}