package {
import citrus.core.starling.StarlingCitrusEngine;
import starling.core.Starling;
import states.*;

[SWF(frameRate="60")]
public class Main extends StarlingCitrusEngine {
  public static const STATES:Object = {
    MENU: Menu,
    GAME: Game
  };

  public function Main() {
    applyStarlingConfiguration();
    setUpStarling(true);

//    switchStateTo(STATES.MENU);
    switchStateTo(STATES.GAME);
  }

  public function switchStateTo(StateReference:Class):void {
    state = new StateReference();
  }

  protected function applyStarlingConfiguration():void {
    Starling.handleLostContext = true;
    Starling.multitouchEnabled = true;
  }

}
}
