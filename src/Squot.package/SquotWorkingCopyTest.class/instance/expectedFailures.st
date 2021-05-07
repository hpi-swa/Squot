failures
expectedFailures
	| bugs |
	bugs := #(testTrackingText "Because patched object graphs are inconsistent: the list of object names does not use the same instances as the referenced objects."
		testTrackingWorkspaceMorph "See above, and merging of objects is incomplete (e. g. support for value objects)").
	bugs flag: #todo. "Fix them"
	^ bugs