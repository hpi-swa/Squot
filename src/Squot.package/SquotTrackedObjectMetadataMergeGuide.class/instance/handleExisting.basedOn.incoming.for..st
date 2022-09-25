callbacks
handleExisting: workingObjectReflection basedOn: baseObjectReflection incoming: incomingObjectReflection for: aMergeBuilder
	"Normal graph merges should initialize an object merge now." "Done only at the end in metadata merges because references back are not supported."
	currentWorking := workingObjectReflection.
	currentIncoming := incomingObjectReflection.
	aMergeBuilder followAllReferencesOfCurrentInstances.