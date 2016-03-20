class Bullet extends Actor {
  public Bullet(float x, float y, float si, float sp) {
    super(x,y,si,sp);
  }
  
  public void moveAndDisplay(ArrayList<Actor> a) {
    ypos += speed;
    fill(255);
    quad(xpos,ypos,xpos,ypos+size,xpos+size,ypos+size,xpos+size,ypos);
  }
}