self-update
errorOutdated
	self error:
		'Trying to load a commit that was created by a version of git/s that is newer
		than the installed version. Please perform a self-update.'
			withoutLineEndings withBlanksCondensed.