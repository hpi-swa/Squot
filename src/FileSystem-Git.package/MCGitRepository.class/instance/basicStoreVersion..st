private
basicStoreVersion: aVersion

	| filesystem |
	
	filesystem := self gitHeadFilesystem.
	
	MCGitWriter
		fileOut: aVersion
		on: (filesystem root "/ aVersion package name")
			ensureDirectory.
			
	filesystem
		commit: aVersion info message
		andTag: aVersion info name.
	filesystem validate.