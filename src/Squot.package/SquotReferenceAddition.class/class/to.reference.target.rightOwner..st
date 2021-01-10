instance creation
to: leftObject reference: aReference target: targetObject rightOwner: rightObject
	^ self new
		setReference: aReference leftOwner: leftObject rightOwner: rightObject target: targetObject;
		yourself