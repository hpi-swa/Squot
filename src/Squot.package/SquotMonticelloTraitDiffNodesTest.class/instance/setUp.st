running
setUp
	| isolatedEnvironment |
	preparedWorkingCopy := SquotWorkingCopy forTestInMemory. "no super setUp!"
	self tearDown.
	isolatedEnvironment := Environment withName: self printString.
	isolatedEnvironment importSelf. "at the time of writing this, PackageInfo looked at the bindings of the current environment instead of its declarations"
	isolatedEnvironment beCurrentDuring:
		[preparedWorkingCopy addPackageNamed: self fakeCategory at: self packagePath].
	self suppressProgressDisplayDuring:
		[preparedWorkingCopy saveVersionWithMessage: 'init'].
	trait := SquotBrowseMockTrait new.
	trait setName: #TestTrait
		andRegisterInCategory: self fakeCategory
		environment: isolatedEnvironment;
		uses: #();
		instVarNamed: 'category' put: self fakeCategory. "set explicitly because Trait>>category was not environment-friendly at the time of writing this, and neither was Trait>>category:"
	PackageInfo squotSetEnvironmentOf: preparedWorkingCopy artifacts anyOne
		to: isolatedEnvironment.