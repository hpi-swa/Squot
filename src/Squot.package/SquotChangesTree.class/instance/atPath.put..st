accessing
atPath: aCollection put: aChangesPart
	| current |
	aCollection ifEmpty: [self error: 'cannot replace the root tree'].
	current := self.
	aCollection allButLastDo: [:part |
		current := current treeAt: part].
	(current children at: aCollection last ifAbsentPut: [OrderedCollection new])
		addLast: aChangesPart.