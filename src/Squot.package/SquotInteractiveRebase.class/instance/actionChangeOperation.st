running
actionChangeOperation
	self activeOperation ifNil: [^ self inform: 'Please select an operation first.'].
	self todoList
		at: (self todoList indexOf: self activeOperation)
		put: (self activeOperation changeOperation ifNil: [^ self]).
	self changed: #todoList.