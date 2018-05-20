loading and unloading
checkMergeBasesOfLoadedVersionWith: aVersion ifNoCommonAncestor: noCommonAncestorBlock ifAncestor: ancestorBlock ifDescendant: descendantBlock
	^ self checkMergeBasesOf: self loadedVersion
		with: aVersion
		ifNoCommonAncestor: noCommonAncestorBlock
		ifAncestor: ancestorBlock
		ifDescendant: descendantBlock