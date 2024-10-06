mappers
replaceMapper: aMapper with: anotherMapper
	self mappers at: (self mappers indexOf: aMapper) put: anotherMapper.
	self changed: #mappers.