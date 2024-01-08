accessing
addAll: aCollection
	self todoList addAll: aCollection.
	self changed: #todoList.