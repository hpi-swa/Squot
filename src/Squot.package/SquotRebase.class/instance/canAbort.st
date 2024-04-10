accessing
canAbort
	^ self hasStarted and: [self operations notEmpty]