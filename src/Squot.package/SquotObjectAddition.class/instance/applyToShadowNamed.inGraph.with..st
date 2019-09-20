patching
applyToShadowNamed: name inGraph: aMutableObjectGraph with: aPatcher
	^ aPatcher addToGraph: (addedObject withSquotObjectName: name)