initialize-release
ensureGitDirectories

	self baseDir ensureDirectory.
	self gitDirectories do: [ :dir | 
		(self baseDir resolve: dir) ensureDirectory ].