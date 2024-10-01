importing
chooseCompatibleMapper: aReference
	^ aReference readStreamDo: [:stream |
		SquotAssetMapper chooseCompatibleMapper: stream ifAmbiguous: [:mappers |
			self
				chooseFromMappers: mappers
				title: ('As which type of asset should {1} be imported?' format: {aReference})]]