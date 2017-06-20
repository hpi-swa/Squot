as yet unclassified
convertToNodes: aMetaobjectDiff
	| existing deferredDiff newNodes |
	existing := nodes at: aMetaobjectDiff ifAbsentPut: [deferredDiff := SquotPlaceholder new].
	(existing notNil and: [existing ~~ deferredDiff]) ifTrue: [^ existing].
	[nodes
		at: aMetaobjectDiff
		put: (newNodes := aMetaobjectDiff asSquotHierarchicalDiffWith: self).
	deferredDiff ifNotNil: [deferredDiff becomeForward: newNodes]]
	ensure: [(deferredDiff notNil and: [newNodes isNil])
			ifTrue: [nodes removeKey: aMetaobjectDiff]].
	^ newNodes