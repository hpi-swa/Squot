actions
onClose
	self hasBeenAccepted ifFalse: [self cancel].
	promise ifNotNil: [promise resolveWith: self].