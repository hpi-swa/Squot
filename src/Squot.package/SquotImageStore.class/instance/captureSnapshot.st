Pur store
captureSnapshot
	"serialize current objects if necessary and return a new snapshot"
	| builder |
	builder := SquotSnapshot builder.
	'Snapshotting objects in memory' displayProgressFrom: 0 to: objects size during:
	[:progress | | done | done := 0.
	objects keysAndValuesDo: [:path :object |
		self store: object at: path in: builder.
		done := done + 1.
		progress value: done]].
	^ builder buildSnapshot