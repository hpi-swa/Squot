mappers
addMapper: aMapper
	self mappers add: aMapper.
	self changed: #mappers.