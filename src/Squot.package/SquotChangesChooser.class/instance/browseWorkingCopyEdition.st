actions
browseWorkingCopyEdition
	selectedNode ifNil: [^ self].
	self selectedNode browseInWorkingCopy.