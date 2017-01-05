Pur store
captureSnapshot
	"serialize current objects if necessary and return a new snapshot"
	| builder |
	builder := SquotSnapshotBuilder new startFrom: self baseSnapshot.
	objects keysAndValuesDo: [:path :object |
		((serializers at: path) for: builder) write: object at: path ].
	^ builder buildSnapshot