actions
actionChangeOperationTo: aRebaseOperationClass
	self replaceWith: ([self changeOperationTo: aRebaseOperationClass]
						on: GSRebaseCancelChangeOperationError
						do: [^ self]).