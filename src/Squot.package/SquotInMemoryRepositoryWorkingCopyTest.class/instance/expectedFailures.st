failures
expectedFailures
	| bugs |
	bugs := #(testTrackingText "Because patched object graphs are inconsistent: the list of object names does not use the same instances as the referenced objects.").
	bugs flag: #todo. "Fix them"
	^ super expectedFailures, bugs