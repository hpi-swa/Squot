accessing
fetchSpecs
	self flag: #stub. "there can be multiple fetch specs!"
	fetchSpecs ifNil: [fetchSpecs := OrderedCollection new.
		repository ifNil: [^ fetchSpecs].
		self addFetchSpecString:	
			((repository remoteConfigFor: self name option: 'fetch')
				ifNil: [^ fetchSpecs])].
	^ fetchSpecs