importing
chooseCompatibleMapper: aReference
	| mappers |
	mappers := SquotAssetMapper allCompatibleMappersFromStream: aReference readStream.
	^ mappers size caseOf: {
		[0] -> [
			self inform: ('Cannot import {1}: Unknown file format.' format: {aReference}).
			nil].
		[1] -> [mappers first].
	} otherwise: [
		UIManager default
			chooseFrom: (mappers collect: #name)
			values: mappers]