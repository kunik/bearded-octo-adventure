package states {
import dragonBones.Armature;
import dragonBones.Bone;
import dragonBones.factorys.StarlingFactory;
import dragonBones.objects.SkeletonData;

import flash.utils.setInterval;
import flash.utils.setTimeout;

import starling.core.Starling;
import starling.display.Image;

import starling.events.ResizeEvent;
import flash.events.Event;

import starling.utils.Color;

public class Game extends Base {
  public static const ResourcesData:Class = Assets.DogDressup;
//  public static const ResourcesData:Class = Assets.DogGray2;

  private static const marginSize:uint = 50;
  private static const characterType:Class = MotorcycleMan;
  private static const characterArmatureName:String = "neutral";

  private var factory:StarlingFactory;
  private var sd:SkeletonData;

  protected function runAnimations(character:Character):void {
//    trace((character.view as Armature).getBone('head').childArmature.getBone('eyes').childArmature.getBone('eye_l').dl);
//    (character.view as Armature).getBone('head').childArmature.getBone('eyes').childArmature.getBone('eye_l').dl.forEach(function(armature:*, _, _):void {
//      if (armature.isPrototypeOf(Armature)) {
//        trace("######################[object Armature:" + armature.name + "]")
//      } else {
//        trace("######################" + armature)
//      }
//    });
//
//    (character.view as Armature).getBone('head').childArmature.getBone('eyes').childArmature.getBone('eye_l').dl.forEach(function(armature:*, _, _):void {
//      if (armature.isPrototypeOf(Armature)) {
//        setEyeColor(armature, 0xD4832B);
//      }
//    });

    character.startMotion("neutral1")
//    setInterval(function():void {
//      //
//      (character.view as Armature).getBone('head').childArmature.getBone('eyes').childArmature.animation.gotoAndPlay('eyes_blink');
//    }, 5000)
  }

  protected function displayCharacter():void {
    var character:Character = createCharacter();

//    character.y = Number(character.height * 0.5 + marginSize);
//    character.x = Number(character.width * 0.5 + marginSize);

    character.y = marginSize;
    character.x = marginSize;
    add(character);

//    setSpotColor(character.view as Armature, 0x2C8FCB);
    setSpotColor(character.view as Armature, Color.RED);
    setMainColor(character.view as Armature, 0xFFF7E7);
    setEyeColor(character.view as Armature, Color.RED);
//    setEyeColor(character.view as Armature, 0xD4832B);


//    var hatArmature:Armature = factory.buildArmature("clothes/hats/hat_1") as Armature;
//    var hat:Bone = hatArmature.getBone("hat1");
//    var placeholder:Bone = (character.view as Armature).getBone("head").childArmature.getBone("placeholder_hat");
//    placeholder.childArmature.getBones().forEach(function(bone:Bone, _, _):void {
//      placeholder.childArmature.removeBone(bone);
//      bone.dispose();
//    });
////    placeholder.childArmature.addBone(hat);
//    hatArmature.dispose();
////    setDressupColor(hat.armature, 0xD4832B);



//
//    var ct:ColorTransform = new ColorTransform()
//    ct.color=0xD4832B;
//    (character.view as Armature).getBone("head").childArmature.getBone("eyes").childArmature.colorTransform = ct

//      var hat:Image = factory.getTextureDisplay("hat") as Image;
//      printBones(factory.buildArmature("dog_boy/dog_teen33") as Armature);


    var hats:Bone = (factory.buildArmature("hats") as Armature).getBone("hats");
    var placeholder:Bone = (character.view as Armature).getBone("head").childArmature.getBone("placeholder_hat");
    placeholder.childArmature.getBones().forEach(function(bone:Bone, _, _):void {
      placeholder.childArmature.removeBone(bone);
      bone.dispose();
    });
    printAnimations(hats.armature);
    hats.armature.animation.gotoAndPlay('hat1');
    placeholder.childArmature.addBone(hats);
    printAnimations(hats.armature);
    setDressupColor(placeholder.childArmature, 0xD4832B);

    setTimeout(function():void {
      setDressupColor(placeholder.childArmature, Color.RED);
    }, 5000);

    setTimeout(function():void {
      var hats:Bone = (factory.buildArmature("hats") as Armature).getBone("hats");
      var placeholder:Bone = (character.view as Armature).getBone("head").childArmature.getBone("placeholder_hat");
      placeholder.childArmature.getBones().forEach(function(bone:Bone, _, _):void {
        placeholder.childArmature.removeBone(bone);
        bone.dispose();
      });
      printAnimations(hats.armature);
      hats.armature.animation.gotoAndPlay('hat2');
      placeholder.childArmature.addBone(hats);
      printAnimations(hats.armature);
      setDressupColor(placeholder.childArmature, Color.AQUA);
    }, 10000);

    setTimeout(function():void {
      var hats:Bone = (factory.buildArmature("hats") as Armature).getBone("hats");
      var placeholder:Bone = (character.view as Armature).getBone("head").childArmature.getBone("placeholder_hat");
      placeholder.childArmature.getBones().forEach(function(bone:Bone, _, _):void {
        placeholder.childArmature.removeBone(bone);
        bone.dispose();
      });
      printAnimations(hats.armature);
      hats.armature.animation.gotoAndPlay('hat3');
      placeholder.childArmature.addBone(hats);
      printAnimations(hats.armature);
      setDressupColor(placeholder.childArmature, Color.GREEN);
    }, 15000);

//      var hat:Image = (factory.buildArmature("hats") as Armature).getBone("hats").display as Image;
//      var placeholder:Bone = (character.view as Armature).getBone("head").childArmature.getBone("placeholder_hat");
//    trace(placeholder)
//      placeholder.display.dispose();
//      placeholder.display = hat;
//
//    printBones(character.view as Armature);

    runAnimations(character);
  }

  protected function setSpotColor(armature:Armature, color:uint, bpath:String=""):void {
    setColor(armature, 'spot', color, bpath);
  }

  protected function setMainColor(armature:Armature, color:uint, bpath:String=""):void {
    setColor(armature, 'color', color, bpath);
  }

  protected function setEyeColor(armature:Armature, color:uint, bpath:String=""):void {
    setColor(armature, 'eyecolor', color, bpath);
  }

  protected function setDressupColor(armature:Armature, color:uint, bpath:String=""):void {
    setMainColor(armature, color, bpath);
  }

  protected function setColor(armature:Armature, boneName:String, color:uint, bpath:String=""):void {
    armature.getBones().forEach(function(bone:Bone, _, _):void {
      if (bone.name.indexOf(boneName) == 0) {
        trace(boneName + ": " + bpath + '/' + bone.name);
        (bone.display as Image).color = color
      }

      if (bone.childArmature) {
        setColor(bone.childArmature, boneName, color, bpath + '/' + bone.name);
      }
    });
  }

  protected function printBones(armature:Armature, prefix:String=""):void {
    armature.getBones().forEach(function(bone:Bone, _, _):void {
      trace(prefix + "- " + bone.name);
      if (bone.childArmature) {
        printBones(bone.childArmature, prefix + "  ");
      }
    });
  }

  protected function printAnimations(armature:Armature, bpath:String=""):void {
    var movementList:Vector.<String> = armature.animation.animationData.movementList;
    trace("[" + bpath + "]:");
    movementList.forEach(function(animationName:String, _, _):void {
      trace("  - " + animationName);
    })
    trace("--");

    armature.getBones().forEach(function(bone:Bone, _, _):void {
      if (bone.childArmature) {
        printAnimations(bone.childArmature, bpath + "/" + bone.name);
      }
    });
  }

  protected function createCharacter(id:uint=0):Character {
    var characterArmature:Armature = factory.buildArmature(characterArmatureName);
//    characterArmature.addEventListener(AnimationEvent.MOVEMENT_CHANGE, function(e):void {
//      trace(e)
//    })
//    (characterArmature.display as Sprite).scaleY = 0.5;
//    (characterArmature.display as Sprite).scaleX = 0.5;

    printBones(characterArmature);
    printAnimations(characterArmature);

    var character:Character = Character(new characterType("character" + id, {width: 244, height: 349, view: characterArmature }));
    return character;
  }

  protected function textureLoadedHandler(evt:Event):void {
    factory.removeEventListener(Event.COMPLETE, textureLoadedHandler);

//    var characterArmature:Armature;
//    sd.animationNames.forEach(function(armatureName:String, _, _):void {
//      characterArmature = factory.buildArmature(armatureName);
//
//      setSpotColor(characterArmature, 0x2C8FCB);
//      setMainColor(characterArmature, 0xFFF7E7);
//      setEyeColor(characterArmature, 0xD4832B);
//    });

    displayCharacter();
  }

  override protected function loadResources():void {
    factory = new StarlingFactory();
    factory.addEventListener(Event.COMPLETE, textureLoadedHandler);
    sd = factory.parseData(new ResourcesData());
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