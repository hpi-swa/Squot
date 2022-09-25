adding and removing
removeAt: path 
	| artifact |
	artifact := artifacts removeKey: path ifAbsent: [].
	artifact ifNil: [^ nil].
	workingCopy unloadArtifact: artifact.
	^ artifact