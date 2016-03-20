abstract class Actor {
  protected float xpos,ypos,size,speed;
  //image
  
  public float getYpos() {
    return ypos;
  }
  
  public float getXpos() {
    return xpos;
  }
  
  public float getSize() {
    return size;
  }
  
  public Actor(float x,float y,float si,float sp) {
    xpos = x;
    ypos = y;
    size = si;
    speed = sp;
  }
  
  public boolean isCollision(Actor a) {
    return (isPointInsideRect(xpos,ypos,a.getXpos(),a.getYpos(),a.getSize()) &&
            isPointInsideRect(xpos+size,ypos,a.getXpos(),a.getYpos(),a.getSize()) &&
            isPointInsideRect(xpos,ypos+size,a.getXpos(),a.getYpos(),a.getSize()) &&
            isPointInsideRect(xpos+size,ypos+size,a.getXpos(),a.getYpos(),a.getSize()));
  }
  
  private boolean isPointInsideRect(float x1, float y1, float x2, float y2, float size) {
    return(x1 > x2 && x1 < x2+size && y1 > y2 && y1 < y2+size); 
  }
  
  public abstract void moveAndDisplay(ArrayList<Actor> a);
}