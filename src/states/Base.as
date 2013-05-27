package states {
import citrus.core.CitrusEngine;
import citrus.core.starling.StarlingState;

public class Base extends StarlingState {
  override public function initialize():void {
    super.initialize();
    loadResources();
    bindListeners();
  }

  protected function get game() {
    return CitrusEngine.getInstance();
  }

  protected function bindListeners():void {
  }

  protected function loadResources():void {
  }
}
}