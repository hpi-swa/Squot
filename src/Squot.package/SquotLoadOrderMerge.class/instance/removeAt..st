patching
removeAt: path
	"Note the removal."
	self assert: (result includes: path).
	result remove: path.
	self resetResolution.