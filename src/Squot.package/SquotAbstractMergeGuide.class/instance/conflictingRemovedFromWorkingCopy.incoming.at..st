callbacks for references
conflictingRemovedFromWorkingCopy: baseTargetReflection incoming: incomingTargetReflection at: pathCollection
	"Note that an object reference was removed in the working copy, but changed to a different target in the incoming version in comparison to the common base."
	self subclassResponsibility