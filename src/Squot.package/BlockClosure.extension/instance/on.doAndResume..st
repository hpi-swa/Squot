*Squot
on: exceptionOrExceptionSet doAndResume: handlerAction
	^ self
		on: exceptionOrExceptionSet
		do: [:exception |
			handlerAction cull: exception.
			exception resume]