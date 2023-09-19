initialize-release
initialize
	super initialize.
	SqueakWorkingCopy addDependent: self. "registry updates"
	self activeProject: (self projectList ifEmpty: [nil] ifNotEmpty: #first).