intercepted
referenceTo: aResolvable 
	^ FSReference 
		filesystem: self
		path: (wrappedFilesystem pathFromObject: aResolvable)