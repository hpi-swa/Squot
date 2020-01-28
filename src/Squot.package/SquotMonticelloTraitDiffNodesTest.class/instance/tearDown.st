running
tearDown
	[(MCWorkingCopy forPackageNamed: self fakeCategory) unregister]
		on: NotFound do: [:e | e return: nil].
	SystemChangeNotifier uniqueInstance doSilently: [trait ifNotNil: [trait removeFromSystem]].
	SquotBrowseMockTrait reset.
	super tearDown.