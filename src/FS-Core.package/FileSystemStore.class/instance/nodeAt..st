public accessing
nodeAt: aPath
	^ self 
		nodeAt: aPath 
		ifPresent: [ :node| node ]
		ifAbsent: [ (NotFound object: aPath) signal ]