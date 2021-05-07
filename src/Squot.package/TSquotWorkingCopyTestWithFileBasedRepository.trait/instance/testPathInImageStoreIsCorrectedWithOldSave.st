tests
testPathInImageStoreIsCorrectedWithOldSave
	| class classPackageName |
	class := self class.
	classPackageName := class category.
	self workingCopy add: class at: 'src'.
	[self workingCopy saveVersionWithMessage: '']
		on: Deprecation do: [:e | e resume].
	self assert: (self
		shouldnt:
			[self workingCopy store
				objectAt: 'src/', classPackageName, '.package/', class name, '.class']
		raise: KeyNotFound) == class.
	self deny: (self workingCopy includesObjectAt: 'src').