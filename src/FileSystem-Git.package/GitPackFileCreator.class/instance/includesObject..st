accessing
includesObject: aGitObject
	| hash |
	hash := aGitObject hash.
	^ self hashDict includesKey: hash