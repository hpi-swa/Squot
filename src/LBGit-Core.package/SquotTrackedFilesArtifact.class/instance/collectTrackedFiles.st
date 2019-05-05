as yet unclassified
collectTrackedFiles

	self commit ifNil: [^ self trackedFiles: Dictionary new].
	self trackedFiles: 
		(self collectFilesOf: self commit tree entries).
	self trackedFiles keysDo: 
		[:key | (self trackedFiles at: key) reference: (self rootDirectory resolve: key)]