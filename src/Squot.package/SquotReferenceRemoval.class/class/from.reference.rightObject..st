instance creation
from: leftObject reference: aReference rightObject: rightObject
	^ self new
		setReference: aReference leftOwner: leftObject rightObject: rightObject;
		yourself