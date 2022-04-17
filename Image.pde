class Image{

  float x, y, w, h;
  PImage im;
  float alpha;
  boolean overlap;
  float age = 255;
//  int fade = int(random(2));
  int fade = 1;
  float fadeRate = random(1, 4);

Image(PImage im_, float sizefactor){
    x = random(width);
    y = random(height);
    im = im_;
    w = im.width/sizefactor;
    h = im.height/sizefactor;
    overlap = false;
    alpha = 180;

    if (x + w > width){
      x = x - (x + w - width);
    }
    if (y + h > height){
      y = y - (y + h - height);
    }
  }

  void display(){
//    if (overlap){
//      tint(255,alpha);
//    } else {
       if (fade == 1){
         tint(255,age);
      } else {
        noTint();
      }
  // }

    image(im, x, y, w, h);
    age -= fadeRate;
    age = constrain(age, 0, 255);
  }

  void overlapSet(){
    overlap = true;
  }


}
