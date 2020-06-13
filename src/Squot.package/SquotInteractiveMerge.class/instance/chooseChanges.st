applying
chooseChanges
	| tool |
	tool := SquotMergeTool on: merge.
	tool workingCopy: self workingCopy;
		"addIgnoredArtifacts: self ignoredArtifacts;"
		controllerForIgnores: self.
	^ (tool selectedChangesWithTitle: self title)
		then: [:ignored | merge resolvedPatch]
		ifRejected: [:ignored | Promise new rejectWith: 'Merge was cancelled']