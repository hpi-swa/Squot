accessing
forGitObject: aGitObject
	^ self value at: aGitObject repository ifAbsent: []