accessing
selectedMapperIfNilInformAnd: aBlock
	^ self selectedMapper ifNil: [
		self inform: 'Please select an asset first.'.
		aBlock value]