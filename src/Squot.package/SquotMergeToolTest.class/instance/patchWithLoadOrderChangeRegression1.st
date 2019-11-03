test objects
patchWithLoadOrderChangeRegression1
	| artifacts newLoadOrder original merge |
	newLoadOrder := #('16' '13' '3' '7' '4' '2' '5' '6' '15' '12' '14' '9' '11' '10' '8' '1').
	artifacts := (1 to: 16) collect: [:each | SquotArtifact new path: each printString; content: SquotArtifactContentMock new; yourself].
	artifacts do: [:each | each content whenComparedWith: each content return: SquotDiffOfEqualObjects new].
	merge := SquotMerge
		into: (original := SquotSnapshot builder addAll: artifacts; buildSnapshot)
		merge: (original createNewBuilder loadOrder: newLoadOrder; buildSnapshot)
		basedOn: original.
	self assert: merge resolvedPatch patchedLoadOrder = newLoadOrder.
	^ merge