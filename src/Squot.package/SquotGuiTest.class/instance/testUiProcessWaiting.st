tests
testUiProcessWaiting
	| promise x |
	self assert: Project uiProcess isActiveProcess.
	promise := Promise new.
	Project current
		addDeferredUIMessage: [x := 13. promise resolveWith: nil];
		addDeferredUIMessage: [(Delay forMilliseconds: 100) wait. x := 42].
	[SquotGUI waitFor: promise]
		on: AssertionFailure do: [:f | self fail: f messageText].
	"Further assertions are built-into waitFor:"
	self assert: Project uiProcess isActiveProcess;
		assert: x = 42 description: 'Deferred messages were not run'.