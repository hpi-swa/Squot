I generate a SquotObjectGraph from live objects, for which shadow objects will be created.

The graph of live objects is traversed with a breadth-first search. Objects are asked to convert themselves into shadows by sending them #captureWithSquot:, with the capturer as the argument. Objects may decide to have a replacement (proxy) captured instead of themselves. In either case, the objects should enumerate their variables and send them to the capturer with #capture:asValueOfSlot:. But objects can also choose to start their own traversal of their relatives. They will not benefit from the multiple-path pruning of the capturer, unless they use #shadowOf:ifAbsentPut: to register the shadows created by their own object graph traversal.

To trace the original object in graphs of snapshots, objects get names assigned. They work like attached global identifiers. The names are kept in a SquotObjectRegistry and also in the created SquotObjectGraph.

Instance Variables
	capturedObject:		<Object> the live object that is being captured
	capturedObjectWithReferrer:	<Object> capturedObject decorated with referrer, if available
	convertedObjects:		<Dictionary> already converted objects (or in progress)
	copiedObjects:		<Dictionary> already visited objects and their shadows (used to mimic DeepCopier)
	enumeratedObject:		<Object> the object whose parts are being captured. If capturedObject wanted to be replaced for capturing, this will be the replacement object.
	replacedObjects:		<Dictionary> associates live objects with their capture replacements
	objectGraph:		<SquotMutableObjectGraph> the graph under construction
	objectRegistry:		<SquotObjectRegistry> the registry used to look up object names
	slotValueReplacements:		<Dictionary> cache for slots with an overridden value to capture
	slotsToConvert:		<Collection> slots whose values must still be changed to the captured shadows
	toBeVisited:		<Collection> search queue for object graph traversal