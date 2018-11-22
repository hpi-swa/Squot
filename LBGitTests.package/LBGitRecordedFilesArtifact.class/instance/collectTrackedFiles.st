as yet unclassified
collectTrackedFiles

	self trackedFiles: 
		(self collectFilesOf: self commit tree entries)