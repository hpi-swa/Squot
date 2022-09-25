tests
expectedFailures
	| superFailures |
	superFailures := super expectedFailures.
	SquotToggles useNewApi ifFalse: [^ superFailures].
	^ superFailures, #(testMergeWithoutBase "artifacts no longer have contents and are not merged on their own anymore.")