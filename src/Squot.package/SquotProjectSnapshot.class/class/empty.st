instance creation
empty
	| emptyProject |
	emptyProject := SquotProject id: UUID nilUUID metadata: SquotTrackedObjectMetadata new artifacts: OrderedDictionary new.
	^ self fromStore: (SquotSnapshotStore project: emptyProject artifactSnapshots: #())