private diffing
noteChanged: anUndecoratedShadow
	| name |
	(objectsWithChanges ifAbsentAdd: anUndecoratedShadow)
		ifFalse: [^ self].
	name := shadowNames at: anUndecoratedShadow.
	resultPatch diffForObjectNamed: name
		ifAbsent: [resultPatch addDiff: (objectDiffs at: anUndecoratedShadow) forObjectNamed: name].
	(referrers removeKey: anUndecoratedShadow ifAbsent: #())
		do: [:each |
			self noteChangedReferrer: each key
				via: each value
				to: anUndecoratedShadow]