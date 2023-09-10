*Squot-Mapper
squotSource
	^ String streamContents: [:stream |
		self printDefinitionOn: stream.
		stream cr; cr.
		self printCommentOn: stream]