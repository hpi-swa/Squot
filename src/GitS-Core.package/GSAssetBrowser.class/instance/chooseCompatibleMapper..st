importing
chooseCompatibleMapper: aReference
	^ aReference readStreamDo: [:stream |
		GSAssetMapper chooseCompatibleMapper: stream ifAmbiguous: [:mappers |
			self
				chooseFromMappers: mappers
				title: ('As which type of asset should {1} be imported?' format: {aReference})]]