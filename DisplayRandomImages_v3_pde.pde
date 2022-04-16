// Reads random images from a folder and displays in random locations on the screen
// Press <space> to pause, <Esc> to exit

import java.io.File;
import java.io.FilenameFilter;
import java.awt.Rectangle;

int minimages = 8;    // Number of images to display at a time
int maximages = 15;

int xfactor = 3;      // Reduce image sizes by this factor
int yfactor = xfactor;

int alpha = 180;  // level of transparency for overlapping images

int interval = 6;   //Length of time between screen refreshes in seconds
int fRate = 60; // frame rate

color backgroundCol = color(175);

String yourPath = "C:\\Users\\dnbar\\Dropbox\\Art\\Ella\\Body of Work\\Ellas course\\DisplayRandomImages_v3_pde\\data";  // Folder containing the images
File someFolder = new File(yourPath);

FilenameFilter filter = new FilenameFilter() {  // Filter ensures only jpegs are selected
  public boolean accept(File dir, String name)
  {
    if (name.endsWith(".JPEG") || name.endsWith(".jpeg")||name.endsWith(".jpg")||name.endsWith(".JPG")) {  //Only displays jpegs
      return true;
    } else {
      return false;
    }
  }
};

String[] someFolderList = someFolder.list(filter);
IntList files = new IntList();

boolean pause = false;

void keyPressed() {
  looping = !looping;
}

void setup() {

  fullScreen();
  frameRate(fRate);
  noStroke();

  textAlign(CENTER);
  textSize(50);
  text("Press any key to pause. Press Esc to exit.", width/2, height/2);

  // Create IntList from 0 to number of files in directory
  for (int i=0; i < someFolderList.length; i++) {
    files.append(i);
  }
}

void draw() {

   ((java.awt.Canvas) surface.getNative()).requestFocus();  // ensures display is focussed

   int test = frameCount % (interval * fRate);

   if (test == (interval * fRate - 1)){
    int numimages = int(random(minimages, maximages));
    background(backgroundCol);  //  background colour

    Image[] img = new Image[numimages];                          // to hold the images once loaded

    files.shuffle();  // shuffle IntList that runs from 0 to 1-(number of files in folder). Avoids duplicates

    for (int i = 1; i <= numimages; i++) {
      int n = files.get(i - 1);
      PImage tempimg = loadImage(yourPath + "\\" + someFolderList[n]);  // Load the image into the program
      img[i-1] = new Image(tempimg, xfactor);

    }

    // Checks to see if images overlap
    for (int i = 0; i < numimages - 2; i++) {

      Image img1 = img[i];
      for (int j = i + 1; j < numimages; j++) {
        // could check to see if collision already true here
        Image img2 = img[j];
        if (img1.x + img1.w > img2.x &&
          img1.x < img2.x + img2.w &&
          img1.y + img1.h > img2.y &&
          img1.y < img2.y + img2.h) {
            img1.overlapSet();
            img2.overlapSet();
            break;
        }
      }
    }

    for (int i=0; i<img.length; i++){
      img[i].display();
    }

    }
   // End of frameCount if statement

  if (test > interval * 40 && frameCount % 4 == 0){
    fill(backgroundCol, 50);
    rect(0,0,width,height);
  }


//  saveFrame("output/image####.png");
}
