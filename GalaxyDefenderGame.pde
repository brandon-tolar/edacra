
/**
*
*
*/

import org.gamecontrolplus.ControlIO;
import org.gamecontrolplus.ControlDevice;

class GalaxyDefenderGame extends PApplet{
  
  private ControlIO control;
  private ControlDevice stick;
  private Random rand = new Random();
  
  private ArrayList<Actor> actors;
  
  private int level = 1;
  
  public GalaxyDefenderGame() {
    size(640,640);
    frameRate(30);
    background(0);
    
    control = ControlIO.getInstance(this);
    stick = control.getMatchedDevice("galaxy_defender.txt");
    if(stick == null) {
      print("ERROR: joystick");
      exit();
    }
    
    actors = new ArrayList<Actor>();
    
    actors.add(new EarthDefender(width/2,height-64,32,8,stick));
  }
  
  public void refresh() {
    background(0);
    if(actors.size() <= 1)
      newLevel();
    
    for(int i = 0; i < actors.size()-2; i++) {
      for(int j = 0; j < actors.size()-1; j++) {
          if(i != j && actors.get(i).isCollision(actors.get(j))) {
            actors.remove(i);
            actors.remove(j);
          }
        }
    }
    
    for(int i = 0; i < actors.size(); i++) {
      if(actors.get(i).getYpos() < 32)
        actors.remove(i);
      else
        actors.get(i).moveAndDisplay(actors);
    }
  }
  
  private void newLevel() {
    switch(level){
      case 1:
        actors.add(new UFO(rand.nextFloat()*width,rand.nextFloat()*height*0.8,32,6));
        actors.add(new UFO(rand.nextFloat()*width,rand.nextFloat()*height*0.8,32,6));
        actors.add(new UFO(rand.nextFloat()*width,rand.nextFloat()*height*0.8,32,6));
        actors.add(new UFO(rand.nextFloat()*width,rand.nextFloat()*height*0.8,32,6));
        break;
      case 2:
        break;
    }
    level++;
  }
  
}