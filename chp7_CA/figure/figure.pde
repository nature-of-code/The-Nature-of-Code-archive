
size(1000,50);

int w = 50;

int total = width/w;

int[] cells = new int[total];
for (int i = 0; i < cells.length; i++) {
  cells[i] = int(random(2)); 
}

print("int[] cells = {");
for (int i = 0; i < cells.length; i++) {
  if (cells[i] == 0) fill(255);
  else fill(64);
  stroke(0);
  rect(i*w,0,w-1,w-1);
  print(cells[i] +",");
}

saveFrame("cells.tif");








