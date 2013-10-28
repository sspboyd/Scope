# Scope

This Processing app takes a base image and makes a new view of the image using several samples from the base image around the mouse pointer. The idea for this came from seeing a [MAC eyelashes ad](http://www.flickr.com/photos/25222951@N08/9477944143/sizes/o/) on bus shelters around Toronto.

A video of the sketch in action.
[![Screencap of the Scope app at work](http://sspboyd.ca/Scope/Scope-Screenshot.jpg "Screencap of the Scope app at work")](https://vimeo.com/77990648)

It is a pretty simple sketch. There are likely a lot of different ways of executing it, and probably much quicker ways of doing it too. What I like about my way is that I can readily add new **Layers** to the **ScopeViewer** (see below for what these mean). And I've already been able to change around the location and display characteristics without major rewriting.



I structured the code by using a scope and layers metaphor. These are the classes created:
### Map
Map holds the image object. Also has w, h, x, y info about itself.
### ScopeViewer
This object does the work of displaying the copied sample images from the base image in the Map object.
### Reticle
This is the object that looks at where the mouse pointer is and then tells the Layers objects to makes copies of the base Map image around the mouse pointer. These copies are stored in an array of Layer objects. The Reticle object initializes the Layers objects and defines the sample sizes of each layer and the display size of each layer. Another important job for Reticle is to constrain the location of the reticle so that it doesn't move off the Map even when the user moves their mouse beyond the Map. Lastly, the reticle object shows a rectangle around the mouse showing the smallest layer's sampling area.
### Layer
This object does pretty much just one thing, it copies and stores a section of the Map. It knows it's location based off of the Reticle object's location and works it out from there. Layer doesn't actually do the rendering of the image. That part is owned by ScopeViewer
### Scope
Last but not least, Scope - This is the base file that glues it all together. The Map, Reticle and ScopeViewer objects are initialized here. Each time draw() is called, each map, reticle, and scopeViewer object is updated and rendered as necessary. Note that Layer is not called. Layer is managed by Reticle. 


Let me know if you have any questions, thanks.
Stephen
[@sspboyd](https://twitter.com/sspboyd)
