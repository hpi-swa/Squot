instance creation
withMapper: aMapper left: leftForm right: rightForm base: baseForm
	^ (self withMapper: aMapper)
		left: leftForm;
		right: rightForm;
		base: baseForm;
		yourself