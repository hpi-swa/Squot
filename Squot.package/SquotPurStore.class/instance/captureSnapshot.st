Pur store
captureSnapshot
	"serialize current objects if necessary and return a new snapshot"
	| builder |
	builder := SquotSnapshotBuilder new startFrom: self baseSnapshot.
	self generateTableOfContentsIn: builder.
	objects keysAndValuesDo: [:path :object | self store: object at: path in: builder].
	^ builder buildSnapshot