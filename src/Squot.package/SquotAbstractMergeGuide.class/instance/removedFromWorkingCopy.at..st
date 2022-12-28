callbacks for references
removedFromWorkingCopy: incomingTargetReflection at: pathCollection
	"Note that an object reference was removed from the working copy at the given path into the graph. The removed reference is the last element of the pathCollection. To update the working copy, nothing needs to be done. But if there are changes in the incoming object, these changes could get lost if this was the only reference to the object. In that case, subclasses should consider whether a conflict of the removal and the changes should be displayed."
	self subclassResponsibility