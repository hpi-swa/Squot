failures
expectedFailures
	| bugsWithNewApi |
	bugsWithNewApi := SquotToggles useNewApi ifFalse: [#()] ifTrue:
		[#(testTrackingText "Because patched object graphs are inconsistent: the list of object names does not use the same instances as the referenced objects. See SquotShadowPatchingTest testUpdatesNameMappingConsistently.")].
	bugsWithNewApi flag: #todo. "Fix them"
	^ super expectedFailures, bugsWithNewApi