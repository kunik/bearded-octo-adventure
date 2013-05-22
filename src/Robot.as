package {
import citrus.objects.CitrusSprite;

public class Robot extends CitrusSprite {
  private var _kx:Number = 1;
  private var _ky:Number = 1;

  public function Robot(name:String, params:Object = null) {
    super(name, params);
  }

  public override function get inverted():Boolean {
    return kx < 0;
  }

  public override function set inverted(value:Boolean):void {
    kx = kx * -1;
  }

  public function get kx():Number {
    return _kx;
  }

  public function set kx(value:Number):void {
    _kx = value;
  }

  public function get ky():Number {
    return _ky;
  }

  public function set ky(value:Number):void {
    _ky = value;
  }

  public function startMoving():void {
    view.animation.gotoAndPlay("run2")
  }
}
}
