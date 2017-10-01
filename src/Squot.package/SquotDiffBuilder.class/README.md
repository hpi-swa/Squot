I create diffs for graphs of objects.

To dispatch the diff creation for two objects, send #left:right: to me.
To create a diff for transforming one shadow into another send #transformingFrom:to: to me.
To create a diff that will replace one object with another at the target, send #replacing:with: to me. This is most relevant for primitive values such as SmallIntegers, Characters, true, false, nil.

In slots-based shadows (SquotObjectShadow and subclasses), I will insert SquotSlotTransitiveChange instances along the path to objects whose slots have been modified. To achieve that, the referrer slots (owning object + the slot itself) are remembered for each visited object. Each such referrer link is like an inverted edge in the diffed object graph. When actual differences for an object are detected, the chain of referrer links is followed to create the SquotSlotTransitiveChange slot diffs.

Instance Variables
	absentShadows:		<Dictionary> cache of shadows (by type) denoting absence
	objectDiffs:				<Dictionary (left shadow)->Diff> already created diffs
	shadowNames:			<Dictionary (left shadow)->name> names of the encountered objects
	diffedPair:		<Association> current pair of compared objects
	graphDiff:		<SquotObjectGraphDiff> that is under construction
	objectsWithChanges:		<Set> objects for which changes have already been found and for which SquotSlotTransitiveChanges have already been created
	referrers:		<Dictionary Object->Collection> inverse edges of the object graph for creating SquotSlotTransitiveChanges when necessary
	toBeVisited:		<Collection> search queue for the object graph traversal
	visited:		<Set> already visited objects, used for multiple-path pruning