collecting tracked files
collectTrackedFiles 

	self trackedFiles: 
		(((self allFiles
			collect: [:each | self pathAndMetadataFor: each])
			reject: [:each | self isSquotFile: each key]) as: Dictionary)