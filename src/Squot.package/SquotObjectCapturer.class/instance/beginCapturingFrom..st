private
beginCapturingFrom: anObject
	| decorated mirror |
	objectGraph := SquotMutableObjectGraph new.
	objectGraph delegateRegistry: objectRegistry.
	walk := SquotGraphWalk startingFrom: anObject.
	toBeVisited removeAll.
	convertedObjects removeAll.
	slotsToConvert removeAll.
	decorated := SquotCreatorDecorator on: anObject creator: nil slot: nil.
	mirror := (thisContext objectClass: anObject) squotMirror.
	mirrors at: anObject put: mirror.
	(mirror shouldObjectHaveNameAssigned: anObject)
		ifTrue: [objectGraph assign: (objectRegistry nameOf: anObject ifAbsent: [self newNameFor: anObject reachedFrom: nil via: nil]) to: anObject]
		ifFalse: [objectGraph assign: objectGraph class anonymousObjectName to: anObject].
	toBeVisited add: decorated.
	self followReferences. "give names to objects and create shadows"
	self convertSlotValues. "redirect slots from live objects to shadows"
	objectGraph startShadow: (convertedObjects at: anObject).
	^ objectGraph as: SquotObjectGraph