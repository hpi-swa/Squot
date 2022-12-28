callbacks
handleAdded: incomingObjectReflection basedOn: baseObjectReflection for: aMergeBuilder
	"Do the same as if it were present without outgoing references (e. g. use nil), except that we do not add reference additions or conflicts because there is no object to patch in the working copy."
	| id |
	id := base nameOf: baseObjectReflection object undecorated ifAbsent: [].
	id ifNotNil: [ids at: baseObjectReflection object undecorated put: id].
	id := incoming nameOf: incomingObjectReflection object undecorated ifAbsent: [].
	id ifNotNil: [ids at: incomingObjectReflection object undecorated put: id].
	currentWorking := SquotObjectReflection object: nil mirror: nil class squotMirror.
	currentIncoming := incomingObjectReflection.
	aMergeBuilder followAllReferencesOfCurrentInstances.