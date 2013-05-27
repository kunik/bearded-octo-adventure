package states {
import dragonBones.Armature;
import dragonBones.factorys.StarlingFactory;

import flash.utils.setInterval;

import starling.core.Starling;
import starling.display.Image;

import starling.events.ResizeEvent;
import flash.events.Event;

public class Game extends Base {
//  public static const ResourcesData:Class = Assets.DogDressup;
  public static const ResourcesData:Class = Assets.DogGray;

  private static const maxWidth:uint = 800;
  private static const characterWidth:uint = 450;
  private static const characterHeight:uint = 200;
  private static const characterType:Class = MotorcycleMan;
  private static const characterArmatureName:String = "teen_boy_neutral";

  private var factory:StarlingFactory;

  protected function runAnimations(character:Character):void {
    character.startMotion("neutral1")
//    setInterval(function():void {
//      (character.view as Armature).getBone('head').childArmature.getBone('eyes').childArmature.animation.gotoAndPlay('eyes_blink1');
//    }, 1000)
  }

  protected function displayCharacter():void {
    var character:Character = createCharacter();

    character.y = Number(characterHeight * 0.5);
    character.x = Number(characterWidth * 0.5);
    add(character);

    setSpotColor(character.view as Armature, 0x2C8FCB);
    setMainColor(character.view as Armature, 0xFFF7E7);

//      var hat:Image = factory.getTextureDisplay("hat") as Image;
//      var hat:Image = (factory.buildArmature("hat") as Armature).getBone("hat").display as Image;

//      var placeholder:Bone = (character.view as Armature).getBone("head").childArmature.getBone("hat_placehplder");
//      placeholder.display.dispose();
//      placeholder.display = hat;

    runAnimations(character);
  }

  protected function setSpotColor(armature:Armature, color:uint, bpath:String=""):void {
    armature.getBones().forEach(function(bone, _, _):void {
      if (bone.name.indexOf('spot') == 0) {
        trace("SPOT: " + bpath);
        (bone.display as Image).color = color
      }

      if (bone.childArmature) {
        setSpotColor(bone.childArmature, color, bpath + '/' + bone.name);
      }
    });
  }

  protected function setMainColor(armature:Armature, color:uint, bpath:String=""):void {
    armature.getBones().forEach(function(bone, _, _):void {
      if (bone.name == 'color') {
        trace("MAIN: " + bpath + '/' + bone.name);
        (bone.display as Image).color = color
      }

      if (bone.childArmature) {
        setMainColor(bone.childArmature, color, bpath + '/' + bone.name);
      }
    });
  }

  protected function printBones(armature:Armature, prefix:String=""):void {
    armature.getBones().forEach(function(bone, _, _):void {
      trace(prefix + "- " + bone.name);
      if (bone.childArmature) {
        printBones(bone.childArmature, prefix + "  ");
      }
    });
  }

  protected function printAnimations(armature:Armature, bpath:String=""):void {
    var movementList:Vector.<String> = armature.animation.animationData.movementList;
    trace("[" + bpath + "]:");
    movementList.forEach(function(animationName, _, _):void {
      trace("  - " + animationName);
    })
    trace("--");

    armature.getBones().forEach(function(bone, _, _):void {
      if (bone.childArmature) {
        printAnimations(bone.childArmature, bpath + "/" + bone.name);
      }
    });
  }

  protected function createCharacter(id:uint=0):Character {
    var characterArmature:Armature = factory.buildArmature(characterArmatureName);
//    (characterArmature.display as Sprite).scaleY = 0.5;
//    (characterArmature.display as Sprite).scaleX = 0.5;

    printBones(characterArmature);
    printAnimations(characterArmature);

    var character:Character = Character(new characterType("character" + id, { view: characterArmature }));
    return character;
  }

  protected function textureLoadedHandler(evt:Event):void {
    factory.removeEventListener(Event.COMPLETE, textureLoadedHandler);

    displayCharacter();
  }

  override protected function loadResources():void {
    factory = new StarlingFactory();
    factory.addEventListener(Event.COMPLETE, textureLoadedHandler);
    factory.parseData(new ResourcesData());
  }

  override protected function bindListeners():void {
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