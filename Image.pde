class Image{

  float x, y, w, h;
  PImage im;
  float alpha;
  boolean overlap;

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
    if (overlap){
      tint(255,alpha);
    } else {
      noTint();
    }

    image(im, x, y, w, h);
  }

  void overlapSet(){
    overlap = true;
  }

}
