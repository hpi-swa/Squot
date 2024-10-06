actions
actionChangeOperationTo: aRebaseOperationClass
	self replaceWith: ([self changeOperationTo: aRebaseOperationClass]
						on: SquotRebaseCancelChangeOperationError
						do: [^ self]).