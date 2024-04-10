actions
actionRemove
	self selectedMapperIfNilInformAnd: [^ self].
	(self confirm: ('Really remove asset ''{1}''?' format: {self selectedMapper name}))
		ifFalse: [^ self].
	self activeWorkingCopy removeMapper: self selectedMapper.
	self selectedMapper: nil.