testing
testPreservesLoadOrderChanges2
	| patchBuilder newLoadOrder patch selectedPatch |
	patchBuilder := SquotPatch builder.
	1 to: 16 do: [:i | patchBuilder addDiff: (SquotArtifactDiffMock path: i asString)].
	newLoadOrder := #('16' '13' '3' '7' '4' '2' '5' '6' '15' '12' '14' '9' '11' '10' '8' '1').
	patchBuilder newLoadOrder: newLoadOrder.
	patch := patchBuilder buildPatch.
	self assert: (patch loadOrderDiff applyTo: ((1 to: 16) collect: #asString)) = newLoadOrder.
	tool := self newToolOn: patch.
	tool rootNodes. "generate nodes"
	"when"
	tool accept.
	selectedPatch := tool selectedPatch.
	"then"
	self assert: (selectedPatch loadOrderDiff applyTo: ((1 to: 16) collect: #asString)) = newLoadOrder.