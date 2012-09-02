private
basicStoreVersion: aVersion
	| filesystem |
	filesystem := self gitHeadFilesystem.
	self flag: 'package names in git repos somehow doesnt fit. maybe use branches instead...'.
	MCGitWriter
		fileOut: aVersion
		on: (filesystem root "/ aVersion package name")
			ensureDirectory.
			
	filesystem
		commit: aVersion info message
		andTag: aVersion info name.
	filesystem validate.