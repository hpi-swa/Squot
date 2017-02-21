public-accessing
entryAt: aName ifAbsent: aBlock
	^ entries 
		at: aName
		ifAbsent: aBlock