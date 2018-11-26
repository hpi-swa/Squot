as yet unclassified
collectTrackedFiles

	self trackedFiles: 
		(self collectFilesOf: self commit tree entries).
	self trackedFiles keysDo: 
		[:key | (self trackedFiles at: key) path: (self rootDirectory resolve: key)]