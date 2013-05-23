package {
import citrus.objects.CitrusSprite;

public class Character extends CitrusSprite {
  public function Character(name:String, params:Object=null) {
    super(name, params);
  }

  public function startMotion(animationName:String):void {
    view.animation.gotoAndPlay(animationName);
  }
}
}


