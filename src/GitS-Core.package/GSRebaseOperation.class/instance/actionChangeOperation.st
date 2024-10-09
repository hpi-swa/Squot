actions
actionChangeOperation
	self replaceWith: ([self changeOperation]
						on: GSRebaseCancelChangeOperationError
						do: [^ self]).