accessing
acceptMessage: anObject

	self message: anObject.
	
	cancelling ifFalse: [self accept]