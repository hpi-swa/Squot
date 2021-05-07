private
at: aHash ifAbsent: aBlock
	(thisContext sender selector beginsWith: 'test')
		ifFalse: [self deprecated: 'Only for tests'].
	^ cache at: aHash ifPresent: [:x | self hit. x] ifAbsent: [self miss. aBlock value]