
public class SoundBall {

  private int pitch;
  private float duration;
  
  private int x = 0;
  private int y = 0;
  
  private int speed;
  
  private int colorR;
  private int colorG;
  private int colorB;
  private int colorA;
  
  private int yVanishValue;
  private int yMax;
  
  public SoundBall(int pitch, float start, float end, int xPos) {
    this.pitch = pitch;
    this.duration = (end - start)*10;
    
    this.yVanishValue = height/4;
    this.yMax = height;
    
    this.y = 0;
    this.x = xPos;
    
    this.speed = 5;
    
    colorR = (int)map(pitch, minValue, maxValue, 0, 255);
    colorG = (int)map(pitch, minValue, maxValue, 255, 0);
    colorB = 0;
    colorA = 100;
  }
  
  public void drawBall(){
    if (this.y>this.yVanishValue) 
      colorA = (int)map(this.y, this.yVanishValue, this.yMax, 100, 10);
    fill(colorR,colorG,colorB,colorA);
    y+=speed;
    circle(x,y,diametro);
  }
  
  public boolean checkLimit() {
    return (y>yMax-diametro);
  }
  
  public void play() {
    int dynamic = (int)map(y, 0, height, 25, 75);
    sc.playNote(pitch, dynamic, duration);
  }
  
  public void playLastOne() {
    int dynamic = (int)map(y, 0, height, 25, 75);
    sc.playNote(pitch, dynamic, duration/5);
  }
  
}
