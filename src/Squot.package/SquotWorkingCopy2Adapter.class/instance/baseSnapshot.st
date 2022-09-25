accessing
baseSnapshot
	self flag: #todo. "Caching of recently saved artifacts."
	^ workingCopy baseVersion snapshot