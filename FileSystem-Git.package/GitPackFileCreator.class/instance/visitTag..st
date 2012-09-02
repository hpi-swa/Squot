visiting
visitTag: aTag
	aTag isLightWeightTag ifTrue: [ ^ self ].
	
	self 
		addObject: aTag;
		visitCommit: aTag object