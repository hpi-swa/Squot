actions
browseIncomingEdition
	selectedNode ifNil: [^ self].
	selectedNode browseIncomingEdition: workingCopy.