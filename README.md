# Scope

This Processing app takes a base image and makes a new view of the image using several samples from the base image around the mouse pointer. The idea for this came from seeing a [MAC eyelashes ad](http://www.flickr.com/photos/25222951@N08/9477944143/sizes/o/) on bus shelters around Toronto.

A video of the sketch in action.
[![Screencap of the Scope app at work](http://sspboyd.ca/Scope/Scope-Screenshot.jpg "Screencap of the Scope app at work")](https://vimeo.com/77990648)

It is a pretty simple sketch. There are likely a lot of different ways of executing it, and probably much quicker ways of doing it too. What I like about my way is that I can readily add new **Layers** to the **ScopeViewer** (see below for what these mean). And I've already been able to change around the location and display characteristics without major rewriting.



I structured the code by using a scope and layers metaphor. These are the classes:
### Map
Map holds the image object. It is the right side of the image above. Pretty simple. Also has w, h, x, y info about itself.
### ScopeViewer
This object does the work of displaying the copied sample images from the base image in the Map object. It is the left size of the image above.
### Reticle
The Reticle object's main job is to look at the location of the mouse pointer and then tell the Layer objects to make copies of the base Map image around that spot. These image copies are then stored in an array of Layer objects. 

Before getting the image copies, Reticle checks the location of the mouse and makes sure that the Reticle location doesn't move off the edge of the Map image. The Processing function [constrain()](http://processing.org/reference/constrain_.html) is really useful here. 

The Reticle does the job of managing the Layer objects. It also initializes them and sets their sample sizes and their display sizes.

Lastly, the reticle object shows a rectangle on the Map to indicate the area currently being sampled. You can see this rectangle over the Cookie Monster's face above.
### Layer
This object does pretty much just one thing, it copies and stores a section of the Map. It knows it's location based off of the Reticle object's location and works it out from there. Layer doesn't actually do the rendering of the image. That part is owned by ScopeViewer
### Scope
Last but not least, Scope. This is the base file that glues it all together. The Map, Reticle and ScopeViewer objects are initialized here. Each time *draw()* is called, the *update()* and *render()* functions are called for Map, Reticle and ScopeViewer as necessary. Note that Layer is not called. Layer is managed by Reticle. 


Let me know if you have any questions. 

Thanks, 
Stephen

[@sspboyd](https://twitter.com/sspboyd)
