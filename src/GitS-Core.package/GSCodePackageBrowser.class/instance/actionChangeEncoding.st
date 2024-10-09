actions
actionChangeEncoding
	| mapper newMapper |
	mapper := self selectedMapper.
	newMapper := mapper changeEncoding ifNil: [^ self].
	self workingCopy replaceMapper: mapper with: newMapper.