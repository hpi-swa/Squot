patching
removeAt: path
	"Note the removal."
	self assert: (editedWorking includes: path).
	containerModifications at: path put: #remove.
	editedWorking remove: path.
	self resetResolution.