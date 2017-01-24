private snapshot building
store: anObject at: path in: aSnapshotBuilder
	| serializer |
	(serializer := (serializers at: path) for: aSnapshotBuilder) write: anObject at: path.
	self storeSquotMetadataFor: anObject serializedBy: serializer in: aSnapshotBuilder at: path.