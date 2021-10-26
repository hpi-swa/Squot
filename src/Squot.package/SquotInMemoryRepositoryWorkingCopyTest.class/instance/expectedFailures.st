failures
expectedFailures
	| bugs |
	bugs := #("testTrackingText" "Because patched object graphs are inconsistent: the list of object names does not use the same instances as the referenced objects. The test currently works due to the optimization that objects that compare equal with #= are not further walked in SquotDiffBuilder, but the issue remains. See SquotShadowPatchingTest testUpdatesNameMappingConsistently.").
	bugs flag: #todo. "Fix them"
	^ super expectedFailures, bugs