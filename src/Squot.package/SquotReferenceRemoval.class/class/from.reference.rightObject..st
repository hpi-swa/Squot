instance creation
from: leftObject reference: aReference rightObject: rightObject
	^ self new
		setReference: aReference leftOwner: leftObject rightObject: rightObject;
		yourself
	"rightObject is not called rightOwner because the object does not own/contain the target object anymore."