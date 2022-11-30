actions
browseOriginalEdition
	selectedNode ifNil: [^ self].
	workingCopy repository withUnitOfWork: [selectedNode browseOriginalEdition: workingCopy].