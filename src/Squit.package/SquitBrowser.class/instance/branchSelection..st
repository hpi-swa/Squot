ui
branchSelection: aGitReference
	(aGitReference isNil or: [aGitReference = '-- Branches --']) ifTrue: [^ self].
	selectedHistorian := self projectSelection repository historianNamed: aGitReference.
	self branchSelectionChanged.