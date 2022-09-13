private
soleParentOf: aVersion orChooseWithPrompt: aString
	| parentVersions parentVersion |
	parentVersions := aVersion parents.
	parentVersion := parentVersions size caseOf: {
		[0] -> [nil].
		[1] -> [aVersion parents anyOne]}
	otherwise: [SquotGUI
			chooseFrom: (parentVersions collect: #printString)
			values: parentVersions
			title: aString].
	^ parentVersion