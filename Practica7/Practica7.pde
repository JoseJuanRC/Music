import java.util.LinkedList;

SoundCipher sc = new SoundCipher(this);

LinkedList<SoundBall> list = new LinkedList<SoundBall>();

int diametro = 50;

PFont f;
boolean intro = true;
boolean finish = false;

void setup() {
     size(800, 800);
     setup_SoundManager();
     noStroke();
     frameRate(60);
     sc.instrument = instrument;
}

void draw(){
  if (intro) {
    intro();
  }
  else if (finish) {
    background(0);
    fill(255);
    textAlign(CENTER);
    f = createFont("Arial",32,true); 
    textFont(f);
    text("Pulsa r para volver a escuchar",width/2,height/2); 
  } else {
     background(240,240,255);
     checkSound();
     if (list.size()>0) {
       for (SoundBall ball : list) {
         ball.drawBall();
       }
       SoundBall ball = list.get(0);
       if (ball.checkLimit()) {
         if (list.size() == 1 && ind>=pitch.length) {
           finish = true; 
           ball.playLastOne();
         } else
           ball.play();
         
         list.removeFirst();
       }
     }
  }
}

void intro() {
  background(0);
  textAlign(CENTER);
  f = createFont("Arial",40,true); 
  textFont(f);
  text("Reproductor",width/2,height/8); 
  
  textAlign(CENTER);
  f = createFont("Arial",28,true); 
  textFont(f);
  text("Controles",width/2,height/3.8); 
  text("Cambiar instrumentos",width/2,height/2); 
  textAlign(LEFT);
  f = createFont("Arial",20, true); 
  textFont(f);
  text("r:                   Resetear",width/20,height/2.8);  
  text("UP/DOWN:   Cambiar la velocidad de reproducción",width/20,height/2.6); 
  text("0) Original                       1) Acoustic Grand Piano\n" +
       "2) Harmonica                  4) Electric Jazz Guitar\n" +
       "4) Violin                           5) Tuba\n" +
       "6) Whistle                        7) Crystal Effect\n" +
       "8) Goblins Effect             9) Tinkle Bell\n",width/4,height/1.75);  

  
  textAlign(CENTER);
  f = createFont("Arial",18,true); 
  textFont(f);
  text("Pulsa enter para continuar",width/2,height/1.20); 

  
  textAlign(LEFT);
  f = createFont("Arial",14,true); 
  textFont(f);
  text("Hecho por: José Juan Reyes Cabrera",0,height/1.02); 
}

void reset(){
  sc.stop();
  finish = false;
  
  list = new LinkedList<SoundBall>();
  
  velocity = 1f;

  currentTime = start[0];
  lastMillis = millis();
  
  ind = 0;
}

void keyPressed(){
  if (keyCode == ENTER && intro) {
    reset();
    intro = false;
  }
  if (keyCode == UP) velocity = (min(velocity+0.1,1.5));
  if (keyCode == DOWN) velocity = (max(velocity-0.1,0.5));
   
  // Reset song
  if (key == 'r' || key == 'R') {
    sc.instrument = instrument;
    reset();
  }
  // Cambiar instrumento
  if (key == '0')
    sc.instrument = instrument;
  if (key == '1')
    sc.instrument = 1; // Acoustic Grand Piano
  if (key == '2')
    sc.instrument = 23; // Harmonica
  if (key == '3')
    sc.instrument = 27; // Electric Jazz Guitar
  if (key == '4')
    sc.instrument = 41; // Violin
  if (key == '5')
    sc.instrument = 59; // Tuba
  if (key == '6')
    sc.instrument = 79; // Whistle
  if (key == '7')
    sc.instrument = 99; // Crystal Effect
  if (key == '8')
    sc.instrument = 102; // Goblins Effect
  if (key == '9')
    sc.instrument = 113; // Tinkle Bell


}
