ui
selectionSummary
	selectedIndex = 0 ifTrue: [^ ''].
	^ (effective values at: selectedIndex) asStringOrText