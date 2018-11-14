public-accessing-objects
branchNamed: aString
	self validateReferenceOrReferenceName: aString.
	^ self objectNamed: (self resolveRef: (self headsDir / aString) fullName)