querying
projectsWithRepository: aSquotRepository do: aBlock
	SquotWorkingCopy registered do:
		[:each | each repository = aSquotRepository ifTrue: [aBlock value: each]].