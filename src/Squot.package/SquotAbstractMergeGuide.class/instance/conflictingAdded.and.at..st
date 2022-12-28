callbacks for references
conflictingAdded: workingTargetReflection and: incomingTargetReflection at: pathCollection
	"Note that an object reference was newly introduced in both the working copy and the incoming version in comparison to the common base, but the target objects of this reference are not the same in the working copy as in the incoming version."
	self subclassResponsibility