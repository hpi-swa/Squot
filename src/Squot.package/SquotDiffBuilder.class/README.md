I create diffs for graphs of objects.

To dispatch the diff creation for two objects, send #left:right: to me.
To create a diff for transforming one shadow into another send #transformingFrom:to: to me.
To create a diff that will replace one object with another at the target, send #replacing:with: to me. This is most relevant for primitive values such as SmallIntegers, Characters, true, false, nil.

Instance Variables
	absentShadows:		<Dictionary> cache of shadows (by type) denoting absence
	comparedObjects:		<Dictionary> of already computed diffs, to cut recursive diffs
	objectDiffs:				<Dictionary> from the left shadow to the diff object that applies to it
	shadowNames:			<Dictionary> from the left shadow to its object's assigned name