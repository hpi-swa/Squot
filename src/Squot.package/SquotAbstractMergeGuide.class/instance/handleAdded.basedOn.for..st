callbacks for objects
handleAdded: incomingObjectReflection basedOn: baseObjectReflection for: aMergeBuilder
	"Decide what to do with a new object that does not exist in the working copy, but in the incoming graph. Send an appropriate message to the merge builder to further investigate the object if this should be done. Also remember the current pair of instances if they are relevant in other callbacks."
	currentWorking := SquotObjectReflection object: nil mirror: nil class squotMirror.
	currentIncoming := incomingObjectReflection.
	self subclassResponsibility.
	aMergeBuilder followAllReferencesOfCurrentInstances.