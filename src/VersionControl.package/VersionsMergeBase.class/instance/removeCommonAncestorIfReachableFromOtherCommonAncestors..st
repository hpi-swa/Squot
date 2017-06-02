computing merge base
removeCommonAncestorIfReachableFromOtherCommonAncestors: aCommonAncestorVersion
	| otherAncestors |
	(commonAncestors includes: aCommonAncestorVersion)
		ifFalse: [^ self].
	markedVersions do: [:each | each removeAllMarks].
	otherAncestors := commonAncestors copyWithout: aCommonAncestorVersion.
	self newMarker
		traverseHistoryFromOrigin: aCommonAncestorVersion
		andOthers: otherAncestors asArray.
	(aCommonAncestorVersion reachableFromOther)
		ifTrue: [commonAncestors remove: aCommonAncestorVersion].
	otherAncestors
		select: [:each | each reachableFromOrigin]
		thenDo: [:each | commonAncestors remove: each].