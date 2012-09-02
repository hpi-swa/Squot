public-accessing-objects
headIfAbsent: aBlock
"Answers the GitCommit object referenced in / via 'HEAD'."
	
	^ self headRef 
		ifNil: aBlock
		ifNotNil: [ :hexHash | self objectNamed: hexHash ]