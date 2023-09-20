mappers
removeMapper: aMapper
	self mappers remove: aMapper.
	self changed: #mappers.