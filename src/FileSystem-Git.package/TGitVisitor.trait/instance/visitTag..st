visiting
visitTag: aTag
	aTag isLightWeightTag ifTrue: [ ^ self ].
	
	self visitCommit: aTag object