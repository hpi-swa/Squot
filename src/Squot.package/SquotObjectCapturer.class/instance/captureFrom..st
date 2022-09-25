public capturing
captureFrom: aBoundReference
	| graphMirror decorated startReflection |
	source := aBoundReference.
	objectGraph := SquotMutableObjectGraph new.
	objectGraph delegateRegistry: objectRegistry.
	toBeVisited removeAll.
	convertedObjects removeAll.
	replacedObjects removeAll.
	slotsToConvert removeAll.
	walk := SquotGraphWalk startingFrom: aBoundReference owner -> aBoundReference mirror.
	walk next.
	graphMirror := objectGraph class squotMirror.
	startReflection := aBoundReference valueReflection.
	decorated := SquotCreatorDecorator on: startReflection object creator: nil slot: nil.
	self capture: startReflection object asValueOf: aBoundReference reference from: aBoundReference owner reflectedIn: aBoundReference mirror intoValueOf: graphMirror rootReference from: objectGraph reflectedIn: graphMirror.
	self followReferences. "give names to objects and create shadows"
	^ objectGraph as: SquotObjectGraph