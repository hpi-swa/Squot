patching
removeAt: path
	"Note the removal."
	self assert: (working includes: path).
	containerModifications at: path put: #remove.
	self resetResolution.