actions
onClose
	self hasBeenAccepted ifFalse: [self cancel].
	self triggerEvent: #closed.