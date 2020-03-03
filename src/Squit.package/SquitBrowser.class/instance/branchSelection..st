ui
branchSelection: aString
	(aString isNil or: [aString = '-- Branches --']) ifTrue: [^ self].
	self withUnitOfWork:
		[selectedHistorian := self projectSelection repository historianNamed: aString.
		self branchSelectionChanged].