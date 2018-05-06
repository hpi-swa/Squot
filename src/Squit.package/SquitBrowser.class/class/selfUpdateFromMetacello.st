updating
selfUpdateFromMetacello
	"Close all instances before updating to avoid any UI glitches"
	self allInstancesDo: [:each | each changed: #close].
	(Smalltalk at: #Metacello) new
		baseline: 'Squot';
		repository: 'github://hpi-swa/Squot:', self selfUpdateBranch, '/src';
		get; load.
	"UpdateWorkingCopy loadVersion: UpdateWorkingCopy baseVersion interactive: false."
	SquitBrowser open