Pur historian
version: aVersion
	| previousCommit |
	aVersion ifNil: [repository delete: self. ^ self].
	previousCommit := self git resolveRef: self expandedName.
	self git
		updateRef: self expandedName
		to: aVersion hexHash
		message: 'reset: moving to ', aVersion hexHash.
	previousCommit ifNil: [Project current addDeferredUIMessage: [repository changed: #historians]].