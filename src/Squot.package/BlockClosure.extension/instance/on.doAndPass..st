*Squot
on: exceptionOrExceptionSet doAndPass: handlerAction
	^ self
		on: exceptionOrExceptionSet
		do: [:exception |
			handlerAction cull: exception.
			exception pass]