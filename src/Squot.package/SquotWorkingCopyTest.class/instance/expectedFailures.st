failures
expectedFailures
	| bugs |
	bugs := #(testTrackingWorkspaceMorph "Merging of objects is incomplete (e. g. support for value objects)").
	bugs flag: #todo. "Fix them"
	^ bugs