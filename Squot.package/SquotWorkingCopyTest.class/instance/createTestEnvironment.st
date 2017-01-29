utilities
createTestEnvironment
	| environment |
	environment := Environment withName: self nameForTestEnvironment asSymbol.
	createdEnvironments add: environment.
	environment import: self class environment.
	environment importSelf.
	^ environment