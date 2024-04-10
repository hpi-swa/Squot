actions
actionChangeOperation
	self replaceWith: ([self changeOperation]
						on: SquotRebaseCancelChangeOperationError
						do: [^ self]).