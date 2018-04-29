loading and unloading
checkMergeBasesOf: myVersion with: otherVersion
ifNoCommonAncestor: noCommonAncestorBlock ifAncestor: ancestorBlock ifDescendant: descendantBlock
	| mergeBases aVersionIsAncestor aVersionIsDescendant |
	mergeBases := otherVersion mergeBasesWith: myVersion.
	mergeBases ifEmpty: [^ noCommonAncestorBlock value].
	aVersionIsAncestor := mergeBases includes: otherVersion.
	aVersionIsAncestor ifTrue: [ancestorBlock value].
	aVersionIsDescendant := mergeBases includes: myVersion.
	aVersionIsDescendant ifTrue: [descendantBlock value].
	^ mergeBases