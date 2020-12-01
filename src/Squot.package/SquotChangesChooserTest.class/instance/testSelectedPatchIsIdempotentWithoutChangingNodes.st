tests
testSelectedPatchIsIdempotentWithoutChangingNodes
	| patch selectedPatch |
	patch := self patchWithTwoChangedArtifacts.
	self assert: (self includesDiffAt: '1' in: patch);
		assert: (self includesDiffAt: '2' in: patch);
		assert: (self patchedLoadOrderAfter: patch) = #('1' '2'). "no changes"
	tool := self newToolOn: patch.
	tool rootNodes. "generate nodes"
	"when"
	tool accept.
	selectedPatch := tool selectedPatch.
	"then"
	self assert: (self resultIncludesDiffAt: '1');
		assert: (self resultIncludesDiffAt: '2');
		assert: self resultLoadOrder = #('1' '2'). "no changes"