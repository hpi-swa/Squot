Pur store
captureSnapshot
	"serialize current objects if necessary and return a new snapshot"
	| builder |
	builder := SquotSnapshot builder.
	objects keysAndValuesDo: [:path :object | self store: object at: path in: builder].
	^ builder buildSnapshot