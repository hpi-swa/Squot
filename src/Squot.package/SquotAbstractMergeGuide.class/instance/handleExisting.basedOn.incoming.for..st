callbacks for objects
handleExisting: workingObjectReflection basedOn: baseObjectReflection incoming: incomingObjectReflection for: aMergeBuilder
	"Decide what to do with an object that exists both in the incoming graph and in the working copy. Send an appropriate message to the merge builder to further investigate the object if this should be done. Also remember the current pair of instances if they are relevant in other callbacks. This is invoked only once per object."
	currentWorking := workingObjectReflection.
	currentIncoming := incomingObjectReflection.
	self subclassResponsibility.
	aMergeBuilder followAllReferencesOfCurrentInstances.