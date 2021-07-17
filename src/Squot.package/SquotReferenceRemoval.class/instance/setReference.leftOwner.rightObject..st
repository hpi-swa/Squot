initialize-release
setReference: aReference leftOwner: leftObject rightObject: rightObject
	super setReference: aReference leftOwner: leftObject rightOwner: rightObject.
	"rightObject is not called rightOwner because the object does not own/contain the target object anymore."