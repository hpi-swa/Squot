accessing
activeOperation: aRebaseOperation
	self assert: (aRebaseOperation isNil or: [self todoList includes: aRebaseOperation]).
	activeOperation := aRebaseOperation.
	self changed: #activeOperation.