tests
assertThatGitObjectsHaveCorrectRepository
	| repository |
	repository := self instVarNamed: 'repository'.
	repository ifNotNil:
		[(repository respondsTo: #filesystemOn:) ifTrue: [repository := repository repository].
		repository exists ifFalse: [^ self].
		[repository withUnitOfWork: [repository unitOfWork allObjects
			do: [:each | self assert: each repository = repository]]]
			on: AssertionFailure do: [:failure | failure pass]
			on: MessageNotUnderstood do: [:error | error return: nil]].