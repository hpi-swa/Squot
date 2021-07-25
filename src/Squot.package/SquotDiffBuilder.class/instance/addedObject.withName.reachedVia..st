private
addedObject: aShadow withName: name reachedVia: aReference
	name ifNotNil: [graphDiff addShadow: aShadow named: name].
	walk addNewObject: aShadow reachedVia: aReference.