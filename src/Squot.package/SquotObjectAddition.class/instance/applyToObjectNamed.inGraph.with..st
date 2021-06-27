patching
applyToObjectNamed: name inGraph: anObjectGraph with: aPatcher
	SquotToggles useNewObjectPatching ifTrue: [self deprecated].
	self checkName: name.
	^ aPatcher rematerialize: (addedObject withSquotObjectName: name)