operations
processDeletions
	| entryPath target |
	deletedPaths copy keysAndValuesDo: [ :path :deletedEntries |
		self processDeletionOf: deletedEntries from: path]