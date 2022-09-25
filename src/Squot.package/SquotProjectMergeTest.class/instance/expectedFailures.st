tests
expectedFailures
	| superFailures |
	superFailures := super expectedFailures.
	SquotToggles useNewApi ifTrue: [^ superFailures].
	"All tests use the new API"
	^ superFailures, self class testSelectors