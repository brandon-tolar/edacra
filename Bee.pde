import java.util.Random;

class Bee extends Actor {
  private Random rand = new Random();
  
  public Bee(float x,float y, float si, float sp) {
    super(x,y,si,sp);
  }
  
  public void moveAndDisplay(ArrayList<Actor> a) {
    if(xpos > width || xpos < 0)
      speed *= -1;
    xpos += speed;
    
    quad(xpos,ypos,xpos,ypos+size,xpos+size,ypos+size,xpos+size,ypos);
  } 
}