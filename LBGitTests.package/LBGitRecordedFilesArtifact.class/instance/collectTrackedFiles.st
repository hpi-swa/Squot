as yet unclassified
collectTrackedFiles

	self halt.
	self trackedFiles: 
		(self collectFilesOf: self commit tree entries)