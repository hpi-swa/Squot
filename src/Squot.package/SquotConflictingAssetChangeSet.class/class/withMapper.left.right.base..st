instance creation
withMapper: aMapper left: leftObject right: rightObject base: baseObject
	^ (self withMapper: aMapper)
		left: leftObject;
		right: rightObject;
		base: baseObject;
		yourself