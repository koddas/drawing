int lastX;
int lastY;
int line_color;
int mode;

void setup() {
  size(800, 600);
  background(255, 0, 0);
  lastX = -1;
  lastY = -1;
  line_color = 0;
  mode = 2;
}

void drawCircle() {
  ellipse(mouseX, mouseY, 50, 50);
  lastX = -1;
  lastY = -1;
}

void drawSquare() {
  rect(mouseX, mouseY, 50, 50);
  lastX = -1;
  lastY = -1;
}

void drawLine() {
  if (lastX > -1 && lastY > -1) {
    line(lastX, lastY, mouseX, mouseY);
  }
  lastX = mouseX;
  lastY = mouseY;
}

void draw() {
}

void keyPressed(KeyEvent e) {
  if (e.getKeyCode() == 10) {
    saveFrame("/home/johan/bild.png"); // Change this to wherever you want to save your picture
  } else if (key == 'c') {
    mode = 0; // Circle
  } else if (key == 'f') {
    mode = 1; // Square ('f' is for Swedish's 'fyrkant')
  } else if (key == 'l') {
    mode = 2; // Line
  } else {
    background(255, 0, 0);
  }
}

void mouseClicked() {
  if (mode == 0) {
    drawCircle(); // Circle
  } else if (mode == 1) {
    drawSquare(); // Square
  } else if (mode == 2) {
    drawLine(); // Line
  }
}

void mouseWheel(MouseEvent e) {
  if (e.getCount() > 0) {
    if (line_color <= 250) {
      line_color = line_color + 5;
    }
  } else {
    if (line_color > 0) {
      line_color = line_color -5;
    }
  }
  stroke(line_color);
}
