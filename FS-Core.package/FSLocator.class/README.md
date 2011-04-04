"I am a late-bound reference. I refer to a file or directory in relation to a well-known location on the filesystem, called an origin. When asked to perform concrete operation, I look up the current location of my origin, and resolve my path against it. 

Usage
----------
FSLocator desktop.
FSLocator desktop basename.

FSLocator home basename.
FSLocator image.
FSLocator vmBinary asAbsolute pathString 
	> '/Applications/Squeak'
FSLocator vmBinary pathString 
	> '/Applications/Squeak'
		
FSLocator vmDirectory parent pathString
	> '/Applications'




Implementation
------------------------
origin 
	A symbolic name for base reference I use to resolve myself.

path
	A relative path that is resolved against my origin"
	
	