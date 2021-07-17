private
beginCapturingFrom: anObject
	| decorated mirror |
	objectGraph := SquotMutableObjectGraph new.
	objectGraph delegateRegistry: objectRegistry.
	mirror := (thisContext objectClass: anObject) squotMirror.
	walk := SquotGraphWalk startingFrom: anObject -> mirror.
	toBeVisited removeAll.
	convertedObjects removeAll.
	replacedObjects removeAll.
	slotsToConvert removeAll.
	decorated := SquotCreatorDecorator on: anObject creator: nil slot: nil.
	(mirror shouldObjectHaveNameAssigned: anObject)
		ifTrue: [objectGraph assign: (objectRegistry nameOf: anObject ifAbsent: [self newNameFor: anObject reachedFrom: nil via: nil]) to: anObject]
		ifFalse: [objectGraph assign: objectGraph class anonymousObjectName to: anObject].
	toBeVisited add: decorated.
	self followReferences. "give names to objects and create shadows"
	objectGraph startShadow: (convertedObjects at: anObject).
	^ objectGraph as: SquotObjectGraph