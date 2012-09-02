visiting
visitTag: aTag
	(self isReachable: aTag) ifTrue: [ ^ self ].
	
	self
		mark: aTag; 
		validate: aTag.
	aTag isLightWeightTag ifTrue: [ ^ self ].
	
	self visit: aTag object