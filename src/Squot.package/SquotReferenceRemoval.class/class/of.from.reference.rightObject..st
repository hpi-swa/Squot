instance creation
of: anObject from: leftObject reference: aReference rightObject: rightObject
	^ self new
		setOldTarget: anObject reference: aReference leftOwner: leftObject rightObject: rightObject;
		yourself
	"rightObject is not called rightOwner because the object does not own/contain the target object anymore."