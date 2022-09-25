tests
expectedFailures
	| superFailures |
	superFailures := super expectedFailures.
	SquotToggles useNewApi ifFalse: [^ superFailures].
	"See SquotProjectMergeTest"
	^ superFailures,
		#(testRemovalsResolvedAutomatically "uses old API"
		testLoadOrderResolution "uses old API")