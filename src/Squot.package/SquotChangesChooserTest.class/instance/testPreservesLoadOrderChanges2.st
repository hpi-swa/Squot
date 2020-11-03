tests load order
testPreservesLoadOrderChanges2
	| patch selectedPatch |
	tool := self newToolOn: (patch := self patchWithLoadOrderChangeRegression1).
	tool rootNodes. "generate nodes"
	"when"
	tool accept.
	selectedPatch := tool selectedPatch.
	"then"
	self assert: self resultLoadOrder = (self patchedLoadOrderAfter: patch).