copying
copyWithDiffApplied: aDiff
	^ (self copyWithDifferentContent: (aDiff applyTo: (self contentOfSameTypeAs: aDiff right content)))
		storeInfo: (aDiff right storeInfo);
		yourself