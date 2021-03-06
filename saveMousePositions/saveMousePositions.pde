/* 
  Hey Addie! Here's the functionality you requested.
  Note this little trick will not work unless you are running the actual application. 
  Build vs. pressing the arrow in processing. 
  I made it quit out and write the file  if you type ^. 
  It writes a file called keyTracker.txt. 
  As it stands now, if you close the window w/out closing the file and flushing data
  you'll get no data. Always do that - or add that funcitonaluty to an on close event:) 
  
  Just drag that file into the DrawMouseShape folder to draw your shape. 
  You can get really playful with it and add all the functionality you need from here
  btw - this method of data stuff is what I normally use for serial data w/Arudio
  so hopefully it'll be helpful later too. 
    
  */ 

import processing.core.*;

import java.util.*;
import java.awt.MouseInfo;
import java.awt.Point;
import java.awt.PointerInfo;
import java.io.*;

  PrintWriter writer; 
  public void setup() 
  {
    try {
    writer = new PrintWriter("keyTracker.txt", "UTF-8");
  } catch (FileNotFoundException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
  } catch (UnsupportedEncodingException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
  }
    
  } 
int currentTweet;
  public void draw()
  {
    PointerInfo inf = MouseInfo.getPointerInfo();
    Point p = inf.getLocation();
    println(p); 
    String  s = Integer.toString(p.x) + "," + Integer.toString(p.y); 
    writer.println(s);
  }
  public void keyPressed()
  {
    if(key == '^'){
      writer.flush();
      writer.close();
      exit();
    } 
  }
