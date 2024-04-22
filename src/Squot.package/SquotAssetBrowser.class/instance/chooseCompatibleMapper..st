importing
chooseCompatibleMapper: aReference
	| mappers groupedMappers maxPriorityMappers |
	mappers := SquotAssetMapper allCompatibleMappersFromStream: aReference readStream.
	mappers ifEmpty: [self inform: ('Cannot import {1}: Unknown file format.' format: {aReference}). ^ nil].
	groupedMappers := mappers groupBy: #importPriority.
	maxPriorityMappers := groupedMappers at: groupedMappers keys max.
	maxPriorityMappers size = 1 ifTrue: [^ maxPriorityMappers anyOne].
	^ self
		chooseFromMappers: mappers
		title: ('As which type of asset should {1} be imported?' format: {aReference})