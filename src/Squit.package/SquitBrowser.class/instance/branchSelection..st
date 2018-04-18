ui
branchSelection: aString
	(aString isNil or: [aString = '-- Branches --']) ifTrue: [^ self].
	selectedHistorian := self projectSelection repository historianNamed: aString.
	self branchSelectionChanged.