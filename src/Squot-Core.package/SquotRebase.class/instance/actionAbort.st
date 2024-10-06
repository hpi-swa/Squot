actions
actionAbort
	self confirmAbort ifFalse: [^ self].
	self abort.