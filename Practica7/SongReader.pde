import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

String fileSong = "song.csv";

void readSong() {
    fileSong = "song.csv";
    BufferedReader reader;
    try {
      reader = createReader(fileSong);
      
      // Comprobamos si hay algún problema
      if (reader == null) {
        println("Fichero no encontrado");
        System.exit(1);
      }
      
      String line = reader.readLine();
      if (line == null) {
        println("Fichero vacio");
        System.exit(1);
      }
      
      // Primero leemos la información sobre instrumento y número de notas
      String[] part = line.split(",");
      instrument = Integer.parseInt(part[0]);
      int size = Integer.parseInt(part[1]);
      
      // Inicializamos los arrays
      pitch = new int[size];
      start = new float[size];
      end = new float[size];
      
      line = reader.readLine();
      int index = 0;
      
      // Leemos el fichero linea a linea
      while (line != null) {
        part = line.split(",");
        pitch[index] = Integer.parseInt(part[0].trim());
        start[index] = Float.parseFloat(part[1].trim());
        end[index] = Float.parseFloat(part[2].trim());
        index++;
        line = reader.readLine();
      }
      reader.close();
    } catch (IOException e) {
      e.printStackTrace();
      System.exit(1);
    }
}
