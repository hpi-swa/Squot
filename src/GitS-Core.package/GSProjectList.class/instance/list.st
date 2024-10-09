toolbuilder
list
	^ GSGitWorkingCopy registeredNames sorted
		ifEmpty: [{'Right click here'. 'to add a project'}
					collect: [:each | GSTextUtilities italic: each]]