package {

import citrus.core.starling.StarlingCitrusEngine;
import starling.core.Starling;

[SWF(frameRate="60")]
public class Main extends StarlingCitrusEngine {
  public function Main() {
    Starling.handleLostContext = true;
    setUpStarling(true);
    state = new GameState();
  }
}

}