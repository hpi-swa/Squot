actions
actionAddOperation
	| newOperation |
	newOperation := [SquotRebaseOperationNoop new changeOperation]
						on: SquotRebaseCancelChangeOperationError
						do: [^ self].
	self add: newOperation.