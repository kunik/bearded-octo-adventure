package states {
import flash.utils.setTimeout;

public class Menu extends Base{
  override protected function bindListeners():void {
    setTimeout(function():void {game.switchStateTo(Main.STATES.GAME)}, 1000)
  }

  override protected function loadResources():void {
//    factory = new StarlingFactory();
//    factory.addEventListener(Event.COMPLETE, textureLoadedHandler);
//    factory.parseData(new ResourcesData());
  }
}
}
