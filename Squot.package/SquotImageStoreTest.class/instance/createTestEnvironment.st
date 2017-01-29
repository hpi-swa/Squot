utilities
createTestEnvironment
	^ (Environment withName: self nameForTestEnvironment asSymbol)
		import: self class environment;
		importSelf;
		yourself