callbacks for references
conflictingRemoved: workingTargetReflection base: baseTargetReflection at: pathCollection
	"Note that an object reference was removed in the incoming version, but changed to a different target in the working copy in comparison to the common base."
	self subclassResponsibility