package {

public class Robot extends Character {
  private var _kx:Number = 1;
  private var _ky:Number = 1;

  public function Robot(name:String, params:Object = null) {
    super(name, params);
  }

  public override function get inverted():Boolean {
    return _kx < 0;
  }

  public override function set inverted(value:Boolean):void {
    _kx = _kx * -1;
  }

  public function get kx():Number {
    return _kx;
  }

  public function get ky():Number {
    return _ky;
  }
}
}
