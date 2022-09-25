accessing
elementMerges
	SquotToggles useNewApi ifTrue:
		[^ elementMerges, (containerConflicts select: [:each | each isResolved and: [each resolution isMerge]] thenCollect: [:each | each resolution])].
	^ elementMerges