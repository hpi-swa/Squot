visiting
visitTag: aTag
	aTag isLightWeightTag ifTrue: [ ^ self ].
	
	self exclude: aTag andIfNotAlreadyExcluded:
		[queue add: aTag object].