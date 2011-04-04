tests
testIsNotRoot
	self deny: (filesystem referenceTo: FSPath / 'plonk') isRoot