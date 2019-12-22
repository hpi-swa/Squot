running
setUp
	| isolatedEnvironment fakeCategory |
	preparedWorkingCopy := SquotWorkingCopy forTestInMemory. "no super setUp!"
	self tearDown.
	isolatedEnvironment := Environment withName: self printString.
	fakeCategory := SquotBrowseMockTrait category, '-DoesNotExist'.
	isolatedEnvironment importSelf. "at the time of writing this, PackageInfo looked at the bindings of the current environment instead of its declarations"
	isolatedEnvironment beCurrentDuring:
		[preparedWorkingCopy addPackageNamed: fakeCategory at: 'package'].
	preparedWorkingCopy saveNewVersionMessage: 'init' interactive: false.
	trait := SquotBrowseMockTrait new.
	trait setName: #TestTrait
		andRegisterInCategory: fakeCategory
		environment: isolatedEnvironment;
		uses: #();
		instVarNamed: 'category' put: fakeCategory. "set explicitly because Trait>>category was not environment-friendly at the time of writing this, and neither was Trait>>category:"
	PackageInfo squotSetEnvironmentOf: preparedWorkingCopy artifacts anyOne
		to: isolatedEnvironment.