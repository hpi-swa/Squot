private snapshot building
storeSquotMetadataFor: anObject serializedBy: aSerializer in: aSnapshotBuilder at: aPath
	(self metadataFor: anObject serializedBy: aSerializer in: aSnapshotBuilder at: aPath)
		writeClassName: anObject class name serializerName: aSerializer name.
	