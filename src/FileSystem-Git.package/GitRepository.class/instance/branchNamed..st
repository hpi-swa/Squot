public-accessing-objects
branchNamed: aString
	self validateReferenceName: aString.
	^ self objectNamed: (self resolveRef: (self headsDir / aString) fullName)