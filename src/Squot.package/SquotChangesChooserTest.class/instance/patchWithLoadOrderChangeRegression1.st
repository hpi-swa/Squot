test objects
patchWithLoadOrderChangeRegression1
	| newLoadOrder patch patchBuilder base |
	base := SquotSnapshot builder.
	patchBuilder := SquotPatch builder.
	1 to: 16 do: [:i | base add: (SquotArtifact new path: i asString)].
	patchBuilder startingFrom: (base := base buildSnapshot).
	base artifactsDo: [:each | patchBuilder addDiff: (SquotArtifactDiffMock path: each path)].
	newLoadOrder := #('16' '13' '3' '7' '4' '2' '5' '6' '15' '12' '14' '9' '11' '10' '8' '1').
	patchBuilder newLoadOrder: newLoadOrder.
	patch := patchBuilder updateRightArtifacts; buildPatch.
	self assert: (patch loadOrderDiff applyTo: ((1 to: 16) collect: #asString)) = newLoadOrder.
	self assert: patch patchedLoadOrder = newLoadOrder.
	^ patch