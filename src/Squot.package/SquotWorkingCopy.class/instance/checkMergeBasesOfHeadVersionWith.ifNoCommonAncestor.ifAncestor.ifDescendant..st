loading and unloading
checkMergeBasesOfHeadVersionWith: aVersion ifNoCommonAncestor: noCommonAncestorBlock ifAncestor: ancestorBlock ifDescendant: descendantBlock
	^ self checkMergeBasesOf: self baseVersion
		with: aVersion
		ifNoCommonAncestor: noCommonAncestorBlock
		ifAncestor: ancestorBlock
		ifDescendant: descendantBlock