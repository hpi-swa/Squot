actions on versions
actionCommitCherryPick
	| parentVersions parentVersion patch |
	parentVersions := self commitSelection parents.
	parentVersion := parentVersions size caseOf: {
		[0] -> [nil].
		[1] -> [self commitSelection parents anyOne]}
	otherwise: [UIManager default
			chooseFrom: (parentVersions collect: #printString)
			values: parentVersions
			title: 'Pick changes in comparison to which parent?'].
	patch := SquotMergePatchBuilder new
		patchFrom: self projectSelection
		to: self commitSelection
		base: parentVersion.
	self projectSelection loadPatchInteractively: patch ifCanceled: [^ self].