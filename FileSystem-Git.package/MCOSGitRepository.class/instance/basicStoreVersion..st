as yet unclassified
basicStoreVersion: aVersion

	super basicStoreVersion: aVersion.
	
	self pushAutomatically ifTrue: [ self push ].
