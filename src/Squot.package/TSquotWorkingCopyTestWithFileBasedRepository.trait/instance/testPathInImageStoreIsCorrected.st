testing
testPathInImageStoreIsCorrected
	| class classPackageName |
	class := self class.
	classPackageName := class category.
	self workingCopy add: class at: 'src'.
	self workingCopy saveNewVersionMessage: '' interactive: false.
	self assert: (self
		shouldnt:
			[self workingCopy store
				objectAt: 'src/', classPackageName, '.package/', class name, '.class']
		raise: KeyNotFound) == class.
	self deny: (self workingCopy includesObjectAt: 'src').