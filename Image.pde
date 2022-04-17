class Image{

  float x, y, w, h;
  PImage im;
//  float alpha;
  boolean overlap;
  float age = 255;
//  int fade = int(random(2));
//  int fade = 1;
  float fadeRate = random(1, 4);

Image(PImage im_, float sizefactor){
    x = random(width);  // x location of image
    y = random(height);  // y location of image
    im = im_;
    w = im.width/sizefactor;  // width of scaled image
    h = im.height/sizefactor;  // height of scaled image
    overlap = false;
  //  alpha = 180;

// If image wuold be off teh screen, put it on the edge

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
//       if (fade == 1){
         tint(255,age); // Image transparency depends on how long its been displayed
      // } else {
      //   noTint();
      // }
  // }

    image(im, x, y, w, h);
    age -= fadeRate;  // increase transparency by random rate
    age = constrain(age, 0, 255);
  }

  void overlapSet(){
    overlap = true;
  }


}
