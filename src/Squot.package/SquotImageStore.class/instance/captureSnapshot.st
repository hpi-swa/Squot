Pur store
captureSnapshot
	"serialize current objects if necessary and return a new snapshot"
	| builder |
	builder := SquotSnapshot builder.
	self activateObjectRegistryDuring:
		['Snapshotting objects in memory' displayProgressFrom: 0 to: objects size during:
		[:progress | | done | done := 0.
		loadOrder do: [:eachPath |
			builder add: (self capture: (objects at: eachPath) at: eachPath).
			done := done + 1.
			progress value: done]]].
	^ builder buildSnapshot