Pur store
captureSnapshot
	"serialize current objects if necessary and return a new snapshot"
	| builder |
	builder := SquotSnapshot builder.
	self activateObjectRegistryDuring:
		[SquotProgress display: 'Snapshotting objects in memory' during:
		[:progress | progress totalSteps: objects size.
		loadOrder do: [:eachPath |
			progress stepWithText: nil.
			builder add: (self capture: (objects at: eachPath) at: eachPath)]]].
	^ builder buildSnapshot