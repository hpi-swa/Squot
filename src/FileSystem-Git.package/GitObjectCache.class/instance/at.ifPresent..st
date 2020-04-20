accessing
at: aHash ifPresent: aBlock
	^ (cache at: aHash ifPresent: [:x | self hit. aBlock value: x]) ifNil: [self miss. nil]