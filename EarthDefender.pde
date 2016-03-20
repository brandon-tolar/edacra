/**
*  player's ship
*  @author btolar
*/
class EarthDefender extends Actor {
  private static final int MAX_WAIT = 8;
  
  private ControlDevice stick;
  private int bulletWait = 0;
  
  public EarthDefender(float x,float y, float si, float sp, ControlDevice st) {
    super(x,y,si,sp);
    stick = st;
  }
  
  public void moveAndDisplay(ArrayList<Actor> a) {
    
    if(stick.getButton("HAT_LEFT").pressed() && xpos > 0)
      xpos -= speed;
    else if(stick.getButton("HAT_RIGHT").pressed() && xpos < width-size)
      xpos += speed;
      
    if(stick.getButton("BTN1").pressed()) {
      if(bulletWait > MAX_WAIT) {
        a.add(new Bullet(xpos+size*.45, ypos+2, 4, -10));
        bulletWait = 0;
      }
    }
      
    if(stick.getButton("BTN8").pressed())
      exit();
    
    bulletWait++;
    display();
  }
  
  public void display() {
    quad(xpos,ypos,xpos,ypos+size,xpos+size,ypos+size,xpos+size,ypos); //<>//
  }
}