actions on branches
actionBranchRemove
	self hasBranchSelection ifFalse: [^ self].
	self withUnitOfWork:
	[selectedHistorian = self projectSelection loadedHistorian
		ifTrue: [^ self inform: 'Cannot delete the active branch, switch to another branch before.'].
	(self confirm: 'Really delete branch ', selectedHistorian name, '?')
		ifFalse: [^ self].
	self projectSelection repository delete: selectedHistorian.
	self branchSelection: (self branchList
			after: selectedHistorian shortName
			ifAbsent: [self branchList
						before: selectedHistorian shortName
						ifAbsent: [self projectSelection loadedHistorian shortName]]).
	self loadBranchList].