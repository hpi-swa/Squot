tests
testUiProcessWaiting
	| promise x |
	self assert: Project uiProcess isActiveProcess.
	browser := SquitBrowser new.
	promise := Promise new.
	Project current
		addDeferredUIMessage: [x := 13. promise resolve];
		addDeferredUIMessage: [(Delay forMilliseconds: 100) wait. x := 42].
	[browser waitFor: promise]
		on: AssertionFailure do: [:f | self fail: f messageText].
	"Further assertions are built-into waitFor:"
	self assert: Project uiProcess isActiveProcess;
		assert: x = 42.