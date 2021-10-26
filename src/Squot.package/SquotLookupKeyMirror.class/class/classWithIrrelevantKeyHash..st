instance creation
classWithIrrelevantKeyHash: aClass
	^ (self class: aClass)
		setKeyHashIrrelevant;
		yourself