callbacks for objects
handleExisting: workingObjectReflection basedOn: baseObjectReflection incoming: incomingObjectReflection for: aMergeBuilder
	self assert: workingObjectReflection object == workingProjectSnapshot.
	aMergeBuilder followAllReferencesOfCurrentInstances.