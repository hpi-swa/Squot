callbacks for references
conflictingChanged: workingTargetReflection to: incomingTargetReflection base: baseTargetReflection at: pathCollection
	"Note that an object reference was modified to a different target in both the working copy and in the incoming version in comparison to the common base, but the new target objects are not the same in the working copy as in the incoming version."
	self subclassResponsibility