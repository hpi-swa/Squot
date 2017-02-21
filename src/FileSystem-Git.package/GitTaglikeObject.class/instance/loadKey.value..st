loading
loadKey: key value: value
	(self isKeyValid: key) ifTrue: [ ^ self loadValidKey: key value: value ].
	self properties at: key put: value