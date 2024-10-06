operations
changedSnapshotForSerializeInto: aFileSystem
	^ self changedSnapshotForCurrentSnapshot: (self mapper loadSnapshotFrom: aFileSystem)