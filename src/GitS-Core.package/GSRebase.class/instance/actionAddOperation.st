actions
actionAddOperation
	| newOperation |
	newOperation := [GSRebaseOperationNoop new changeOperation]
						on: GSRebaseCancelChangeOperationError
						do: [^ self].
	self add: newOperation.