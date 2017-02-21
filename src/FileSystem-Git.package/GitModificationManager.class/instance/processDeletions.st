operations
processDeletions
	| entryPath target |
	self flag: #GitTodo. "sort these by path depth like in #processCreations"
	deletedPaths copy keysAndValuesDo: [ :path :deletedEntries |
		self processDeletionOf: deletedEntries from: path]