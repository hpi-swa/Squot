tests
testMethodsGetExcludedIfOnlyTheirStampsChanged
	| methodNode |
	tool := self newToolOn: (self patchModifyingMethodTimestampInArtifactAt: 'src/TestPackage.package').
	tool rootNodes. "compute"
	methodNode := tool rootNodes first children first children first.
	tool selectNode: methodNode.
	self deny: tool selectedDiffNodeIsIncluded.