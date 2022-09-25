querying
projectsWithRepository: aSquotRepository do: aBlock
	(SquitSettings useNewApi ifTrue: [SquotWorkingCopy2] ifFalse: [SquotWorkingCopy]) registered do:
		[:each | each repository = aSquotRepository ifTrue: [aBlock value: each]].