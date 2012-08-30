accessing
addObject: aGitObject
	| hash |
	hash := aGitObject hash.
	(self hashSet includes: hash)
		ifTrue: [ ^ self ]
		ifFalse: [
			self hashSet at: hash put: nil.
			self orderedHashes add: hash ]