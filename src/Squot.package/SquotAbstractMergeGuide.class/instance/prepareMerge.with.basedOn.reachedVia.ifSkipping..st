callbacks for objects
prepareMerge: workingObjectReflection with: incomingObjectReflection basedOn: baseObjectReflection reachedVia: aReference ifSkipping: skipBlock
	"Prepare all that is necessary to record merge information about the given instances of the same object. This is invoked only once per object. baseObjectReflection can be a reflection of nil if there was no common base found during the merge. Evaluate the skipBlock if the object should not be further investigated during the merge."
	self subclassResponsibility