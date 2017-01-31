instance creation
on: aFileSystemStore ignoring: aSetOfPathStrings addingTo: aSnapshotBuilder
	^ self new 
		fileStore: aFileSystemStore;
		ignoredPaths: aSetOfPathStrings;
		snapshotBuilder: aSnapshotBuilder;
		yourself