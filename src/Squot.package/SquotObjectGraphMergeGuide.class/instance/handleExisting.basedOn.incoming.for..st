callbacks
handleExisting: workingObjectReflection basedOn: baseObjectReflection incoming: incomingObjectReflection for: aMergeBuilder
	"Normal graph merges should initialize an object merge now."
	| id |
	id := working nameOf: workingObjectReflection object undecorated ifAbsent: [].
	id ifNotNil: [ids at: workingObjectReflection object undecorated put: id].
	id := base nameOf: baseObjectReflection object undecorated ifAbsent: [].
	id ifNotNil: [ids at: baseObjectReflection object undecorated put: id].
	id := incoming nameOf: incomingObjectReflection object undecorated ifAbsent: [].
	id ifNotNil: [ids at: incomingObjectReflection object undecorated put: id].
	currentWorking := workingObjectReflection.
	currentIncoming := incomingObjectReflection.
	aMergeBuilder followAllReferencesOfCurrentInstances.