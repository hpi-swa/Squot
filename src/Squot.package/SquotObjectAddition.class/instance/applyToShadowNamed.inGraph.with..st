patching
applyToShadowNamed: name inGraph: aMutableObjectGraph with: aPatcher
	self checkName: name.
	^ aPatcher addToGraph: (addedObject withSquotObjectName: name)