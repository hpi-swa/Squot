private
fetch
	self withActiveUnitOfWork:
		[repository importFromAll: remoteNames.
		promise resolveWith: self].
	self flag: #todo. "In the future, might collect all updated refs and return that (to resolve the promise with that)."