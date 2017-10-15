ui
selectActiveHistorian
	self hasProjectSelection ifFalse: [^ self].
	self selectedHistorian: self projectSelection loadedHistorian.