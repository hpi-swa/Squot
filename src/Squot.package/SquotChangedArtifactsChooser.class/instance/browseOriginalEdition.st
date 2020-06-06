actions
browseOriginalEdition
	selectedNode ifNil: [^ self].
	selectedNode browseOriginalEdition: workingCopy.