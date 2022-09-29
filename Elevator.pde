color buttonColor = color(190);
color baseColor = color(205);
color hoverColor = color(120);
color clickColor = color(255);
color callColor = color(255,126,126);
color stopColor = color(255,0,0);
color close_open_Color = color(147,184,255);
String floor_num = "1";
color floor_1_set = buttonColor;
color floor_2_set = buttonColor;
color floor_3_set = buttonColor;
color call_set = buttonColor;
color stop_set = color(255,126,126);
color open_set = buttonColor;
color close_set = buttonColor;
color floor_1C = buttonColor;
color floor_2C = buttonColor;
color floor_3C = buttonColor;
color closeC = buttonColor;
color openC = buttonColor;
color callC = buttonColor;
color stopC = color(255,126,126);
PImage br_1;
PImage br_2;
PImage br_3;
PImage e_speaker;
int sTime;
int tTime = 3000;
boolean floor_1_hover = false;
boolean floor_2_hover = false;
boolean floor_3_hover = false;
boolean close_hover = false;
boolean open_hover = false;
boolean call_hover = false;
boolean stop_hover = false;

void setup(){
  size(400,900);
  int sTime = millis();
  br_1 = loadImage("br_1.png");
  br_2 = loadImage("br_2.png");
  br_3 = loadImage("br_3.png");
  e_speaker = loadImage("e_speaker.png");
  e_speaker.resize(42,42);
}

void draw(){
  update(mouseX, mouseY);
  int passedTime = millis() - sTime;
  if(passedTime > tTime){
    if(floor_2_set == clickColor){
      floor_num = "2";
      floor_2_set = buttonColor;
    }else if(floor_3C == clickColor){
      floor_num = "3";
      floor_3_set = buttonColor;
    }else if(floor_1C == clickColor){
      floor_num = "1";
      floor_1_set = buttonColor;
    }else if(callC == callColor){
      call_set = buttonColor;
      floor_num = "C";
    }else if(stopC == stopColor){
      stop_set = buttonColor;
      floor_num = "S";
    }else if(openC == close_open_Color){
      open_set = buttonColor;
    }else if(closeC == close_open_Color){
      close_set = buttonColor;
    }
    sTime = millis();
  }
  
  noStroke();
  if(floor_3_hover){
    floor_3C = hoverColor;
  }else if(floor_2_hover){
    floor_2C = hoverColor;
  }else if(floor_1_hover){
    floor_1C = hoverColor;
  }else if(close_hover){
    closeC = hoverColor;
  }else if(open_hover){
    openC = hoverColor;
  }else if(call_hover){
    callC = hoverColor;
  }else if(stop_hover){
    stopC = hoverColor;
  }else{
    floor_1C = floor_1_set;
    floor_2C = floor_2_set;
    floor_3C = floor_3_set;
    closeC = close_set;
    openC = open_set;
    callC = call_set;
    stopC = stop_set;
  }
  
  background(baseColor);
  fill(openC);
  ellipse(50,800,50,50);
  fill(closeC);
  ellipse(120,800,50,50);
  fill(callC);
  ellipse(275,800,50,50);
  fill(stopC);
  ellipse(345,800,50,50);
  fill(floor_3C);
  ellipse(200,300,80,80);
  fill(floor_2C);
  ellipse(200,450,80,80);
  fill(floor_1C);
  ellipse(200,600,80,80);
  fill(0);
  rect(100,50,200,100);
  
  fill(0,0,0);
  textSize(50);
  text("1",190,615);
  text("2",190,465);
  text("3",190,315);
  
  textSize(25);
  text("<|>",36,810);
  text(">|<",106,810);
  
  textSize(20);
  text("CALL",255,807);
  text("STOP",323,807);
  
  textSize(100);
  fill(255,0,0);
  text(floor_num,175,130);
  
  image(br_1,250,585);
  image(br_2,250,435);
  image(br_3,250,285);
  image(e_speaker,256,725);
}

void update(int x, int y) {
  if(overButton(200,300,80)){
    floor_3_hover = true;
  }else if(overButton(200,450,80)){
    floor_2_hover = true;
  }else if(overButton(200,600,80)){
    floor_1_hover = true;
  }else if(overButton(50,800,50)){
    open_hover = true;
  }else if(overButton(120,800,50)){
    close_hover = true;
  }else if(overButton(275,800,50)){
    call_hover = true;
  }else if(overButton(345,800,50)){
    stop_hover = true;
  }else{
    floor_1_hover = false;
    floor_2_hover = false;
    floor_3_hover = false;
    open_hover = false;
    close_hover = false;
    call_hover = false;
    stop_hover = false;
  }
}

void mousePressed(){
  if(floor_3_hover){
    floor_3_set = clickColor;
  }else if(floor_2_hover){
    floor_2_set = clickColor;
  }else if(floor_1_hover){
    floor_1_set = clickColor;
  }else if(call_hover){
    call_set = callColor;
  }else if(stop_hover){
    stop_set = stopColor;
  }else if(close_hover){
    close_set = close_open_Color;
  }else if(open_hover){
    open_set = close_open_Color;
  }
}

boolean overButton(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
