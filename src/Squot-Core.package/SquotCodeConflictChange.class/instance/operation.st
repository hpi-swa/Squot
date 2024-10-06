accessing
operation
	self isResolved ifFalse: [^ nil].
	^ self mapper operationFrom: self left to: self resolution