Pur historian
version: aVersion
	aVersion ifNil: [repository delete: self. ^ self].
	gitRepository
		updateRef: self expandedName
		to: aVersion hexHash
		message: 'reset: moving to ', aVersion hexHash