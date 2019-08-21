tests
testPreservesLoadOrderChanges
	| selectedPatch |
	tool := self newToolOn: self patchWithLoadOrderChange.
	tool rootNodes. "generate nodes"
	"when"
	tool accept.
	selectedPatch := tool selectedPatch.
	"then"
	self assert: self resultLoadOrder = #('2' '1').