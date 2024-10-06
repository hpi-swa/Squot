instance creation
startsWith: aPath
	^ self new
		path: aPath;
		disallowLeading;
		allowTrailing;
		yourself