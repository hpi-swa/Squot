*GitS-Core-Code
gitSSources
	^ {
		self definitionString.
		String streamContents: [:stream | self printClassSideDefinitionOn: stream].
		self comment.
	}