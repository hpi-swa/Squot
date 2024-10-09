accessing
atPath: aCollection
	| current |
	current := {self}.
	aCollection do: [:part | | tree |
		tree := current detect: #isTree ifNone: [^ {}].
		current := tree children at: part ifAbsent: [^ {}]].
	^ current select: #isChange thenCollect: #value