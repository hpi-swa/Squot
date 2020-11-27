patching
removeAt: path
	"Note the removal."
	self assert: (editedWorking includes: path).
	editedWorking remove: path.
	self resetResolution.