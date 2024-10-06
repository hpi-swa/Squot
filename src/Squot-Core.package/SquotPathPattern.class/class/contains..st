instance creation
contains: aPath
	^ self new
		path: aPath;
		allowLeading;
		allowTrailing;
		yourself