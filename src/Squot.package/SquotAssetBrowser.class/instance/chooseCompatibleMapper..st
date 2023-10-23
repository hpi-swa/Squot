importing
chooseCompatibleMapper: aReference
	| mappers nonGenericMappers |
	mappers := SquotAssetMapper allCompatibleMappersFromStream: aReference readStream.
	nonGenericMappers := mappers reject: #isGeneric.
	^ nonGenericMappers size caseOf: {
		[0] -> [
			mappers
				ifEmpty: [self inform: ('Cannot import {1}: Unknown file format.' format: {aReference}). nil]
				ifNotEmpty: [self
								chooseFromMappers: mappers 
								title:
									('Unknown file format: {1}. You can import it as one of these ',
									'generic asset types (or cancel to stop the import of this file):'
										format: {aReference})]].
		[1] -> [nonGenericMappers first].
	} otherwise: [self
					chooseFromMappers: nonGenericMappers
					title: ('As which type of asset should {1} be imported?' format: {aReference})]