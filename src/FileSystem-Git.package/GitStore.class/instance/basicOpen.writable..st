delegate
basicOpen: aPath writable: isWritable
	isWritable ifTrue: [ modManager markFileCreated: aPath ].
	self ensure: aPath.
	^ cacheStore
		basicOpen: aPath
		writable: isWritable