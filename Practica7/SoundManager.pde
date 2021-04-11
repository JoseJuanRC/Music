import arb.soundcipher.*;

// Distintas notas de la cancion y sus tiempos
int[] pitch;
float[] start;
float[] end;

// Original instrument
int instrument;

int ind = 0; // Indice actual del sonido

// Nota mayor y menor
int minValue;
int maxValue;

float velocity = 1f;

float currentTime = 0;
float lastMillis = 0;


void setup_SoundManager(){
  readSong();
  minValue = 100;
  maxValue = 0;
  
  for (int i : pitch) {
    if (i<minValue) minValue = i;
    if (i>maxValue) maxValue = i;
  }
  
  
}

// Comprobamos si tenemos que añadir una nueva bola de sonido
void checkSound() {
   if (ind<pitch.length) {
     currentTime += velocity*(millis() - lastMillis)/1000.0;
     lastMillis = millis();
     
     if (currentTime<start[ind]) return;
     
     int xPos = (int)map(pitch[ind], minValue, maxValue, diametro, width-diametro);
     list.add(new SoundBall(pitch[ind], start[ind], end[ind], xPos));
     ind++;
   }
}
