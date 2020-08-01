ui
selectActiveHistorian
	self hasProjectSelection ifFalse: [^ self].
	self withUnitOfWork:
		[self selectedHistorian: self projectSelection loadedHistorian].