instance creation
for: aString
	{SquotBaseWorkingCopy. SquotGitWorkingCopy} do: [:class |
		(self tryNamed: aString from: class) ifNotNil: [:instance | ^ instance]].
	(self tryMCRepositoryNamed: aString) ifNotNil: [:instance | ^ instance].
	self error: ('No project with the name {1} could be found.' format: {aString printString}).