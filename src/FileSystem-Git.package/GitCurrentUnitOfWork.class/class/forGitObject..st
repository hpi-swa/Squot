accessing
forGitObject: aGitObject
	^ Registry at: aGitObject repository ifAbsent: [self value]