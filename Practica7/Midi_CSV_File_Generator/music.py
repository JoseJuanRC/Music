import pretty_midi

# Introducimos el fichero midi
midi_data = pretty_midi.PrettyMIDI('song.mid')

instr = 0

data = []

# Por cada instrumento vamos añadiendo las notas y tiempos
for instrument in midi_data.instruments:
    instr = instrument.program
    for note in instrument.notes:
        data.append([note.pitch, note.start, note.end])

# Ordenamos según el tiempo de inicio de una nota

data.sort(key=lambda x:x[1])

# Mostramos como se vería desde processing

pitch = [i[0] for i in data]
res = str(pitch[0])
for i in range(1, len(pitch)):
  res += ", " + str(pitch[i])
print("int[] pitch = {" +res + "};");

start = [i[1] for i in data]
res = str(start[0])
for i in range(1, len(start)):
  res += ", " + str(start[i])
print("float[] start = {" +res + "};");

end = [i[2] for i in data]
res = str(end[0])
for i in range(1, len(end)):
  res += ", " + str(end[i])
print("float[] end = {" +res + "};");

print("int instrument = " + str(instr) + ";");

# Guardamos en un fichero

outF = open("song.csv", "w")

line = (str(instr)) + "," + str(len(pitch)) + "\n";
outF.write(line)

for i in range(0, len(pitch)):
  line = str(pitch[i]) + "," + str(start[i]) + "," + str(end[i]) + "\n"
  outF.write(line)

outF.close()