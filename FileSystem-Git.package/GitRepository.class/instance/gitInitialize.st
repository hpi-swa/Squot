initialize-release
gitInitialize
	"This should do roughly the same as the git-init command"
	self exists
		ifTrue: [ ^ self ].
	self baseDir ensureDirectory.
	self gitDirectories do: [ :dir | (self baseDir resolve: dir) createDirectory ].
	self initializeHEAD.