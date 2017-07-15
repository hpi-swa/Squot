loading and unloading
checkMergeBasesWith: aVersion ifNoCommonAncestor: noCommonAncestorBlock ifAncestor: ancestorBlock ifDescendant: descendantBlock
	| mergeBases aVersionIsAncestor aVersionIsDescendant |
	mergeBases := aVersion mergeBasesWith: self baseVersion.
	mergeBases ifEmpty: [^ noCommonAncestorBlock value].
	aVersionIsAncestor := mergeBases includes: aVersion.
	aVersionIsAncestor ifTrue: [ancestorBlock value].
	aVersionIsDescendant := mergeBases includes: self baseVersion.
	aVersionIsDescendant ifTrue: [descendantBlock value].
	^ mergeBases