*Squot-Core-Code
squotSources
	^ {
		self definitionString.
		String streamContents: [:stream | self printClassSideDefinitionOn: stream].
		self comment.
	}