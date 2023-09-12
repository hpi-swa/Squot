refs
allReferences
	^ Array streamContents: [:stream |
		self allReferencesDo: [:each |
			stream nextPut: each]]