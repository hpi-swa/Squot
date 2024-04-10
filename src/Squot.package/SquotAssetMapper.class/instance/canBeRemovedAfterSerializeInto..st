testing
canBeRemovedAfterSerializeInto: aFileSystem
	^ self canBeRemovedForVersion: (self loadVersionFrom: aFileSystem)