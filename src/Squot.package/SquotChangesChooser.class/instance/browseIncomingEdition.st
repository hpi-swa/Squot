actions
browseIncomingEdition
	selectedNode ifNil: [^ self].
	workingCopy repository withUnitOfWork: [selectedNode browseIncomingEdition: workingCopy].