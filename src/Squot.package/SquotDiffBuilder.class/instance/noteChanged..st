private diffing
noteChanged: anUndecoratedShadow
	| name numberOfObjectsWithChangesBefore |
	numberOfObjectsWithChangesBefore := objectsWithChanges size.
	objectsWithChanges add: anUndecoratedShadow.
	numberOfObjectsWithChangesBefore ~= objectsWithChanges size
		ifFalse: ["was already present in the set" ^ self].
	name := shadowNames at: anUndecoratedShadow.
	graphDiff diffForObjectNamed: name
		ifAbsent: [graphDiff addDiff: (objectDiffs at: anUndecoratedShadow) forObjectNamed: name].
	(referrers removeKey: anUndecoratedShadow ifAbsent: #())
		do: [:each |
			self noteChangedReferrer: each key
				via: each value
				to: anUndecoratedShadow]