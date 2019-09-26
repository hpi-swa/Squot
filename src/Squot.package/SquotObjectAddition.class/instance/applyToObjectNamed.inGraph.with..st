patching
applyToObjectNamed: name inGraph: anObjectGraph with: aPatcher
	self checkName: name.
	^ aPatcher rematerialize: (addedObject withSquotObjectName: name)