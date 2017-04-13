loading and unloading
mergeVersionInteractively: aVersion
	"Let the user choose artifact editions to load from aVersion and add the version as parent version."
	(self loadVersionInteractively: aVersion)
		ifTrue: [self addParentVersion: aVersion].