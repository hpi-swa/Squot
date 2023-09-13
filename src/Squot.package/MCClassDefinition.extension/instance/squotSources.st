*Squot-Mapper
squotSources
	^ {
		self definitionString.
		String streamContents: [:stream | self printClassSideDefinitionOn: stream].
		self comment.
	}