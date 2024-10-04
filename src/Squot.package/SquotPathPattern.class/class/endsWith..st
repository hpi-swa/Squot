instance creation
endsWith: aPath
	^ self new
		path: aPath;
		allowLeading;
		disallowTrailing;
		yourself