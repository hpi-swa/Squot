encodings
chooseCompatibleMapper: aStream ifAmbiguous: aBlock
	| mappers groupedMappers maxPriorityMappers |
	mappers := SquotAssetMapper allCompatibleMappersFromStream: aStream.
	self assert: mappers notEmpty description: 'Expected at least one mapper (blob) to be compatible.'.
	groupedMappers := mappers groupBy: #importPriority.
	maxPriorityMappers := groupedMappers at: groupedMappers keys max.
	maxPriorityMappers size = 1 ifTrue: [^ maxPriorityMappers anyOne].
	^ aBlock value: mappers