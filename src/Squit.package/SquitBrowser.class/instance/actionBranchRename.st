actions on branches
actionBranchRename
	| newHistorian newName oldHistorian oldName |
	self hasBranchSelection ifFalse: [^ self].
	oldHistorian := selectedHistorian.
	oldName := oldHistorian name.
	newName := UIManager default request: 'New branch name' initialAnswer: oldName.
	(newName = oldName or: [newName isEmpty])
		ifTrue: [^ self].
	newHistorian := oldHistorian repository historianNamed: newName.
	newHistorian version notNil ifTrue:
		[UIManager default inform: 'Branch ', newName, ' already exists!'.
		^ self].
	newHistorian version: oldHistorian version.
	oldHistorian repository delete: oldHistorian.
	self projectSelection loadedHistorian = oldHistorian ifTrue:
		[self projectSelection loadedHistorian: newHistorian].
	self selectedHistorian: newHistorian.
	self loadBranchList.