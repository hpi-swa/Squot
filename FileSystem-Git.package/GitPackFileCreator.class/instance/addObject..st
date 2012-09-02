accessing
addObject: aGitObject
	| hash |
	hash := aGitObject hash.
	self hashDict 
		at: hash
		ifAbsent: [
			self hashDict at: hash put: nil.
			self orderedHashes add: hash ]