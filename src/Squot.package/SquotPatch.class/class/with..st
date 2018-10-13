instance creation
with: diffDictionary
	self deprecated: 'Use SquotPatch builder instead'.
	^ self new
		initializeWith: diffDictionary;
		yourself