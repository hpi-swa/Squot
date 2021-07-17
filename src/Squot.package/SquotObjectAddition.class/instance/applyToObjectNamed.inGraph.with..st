patching
applyToObjectNamed: name inGraph: anObjectGraph with: aPatcher
	self deprecated.
	self checkName: name.
	^ aPatcher rematerialize: (addedObject withSquotObjectName: name)