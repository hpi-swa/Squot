instance creation
exactMatch: aPath
	^ self new
		path: aPath;
		disallowLeading;
		disallowTrailing;
		yourself