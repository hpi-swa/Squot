actions on branches
actionBranchRename
	| newHistorian newName oldHistorian oldName |
	self hasBranchSelection ifFalse: [^ self].
	self withUnitOfWork:
	[oldHistorian := selectedHistorian.
	oldHistorian isRemoteTrackingHistorian ifTrue: [^ self inform: 'To rename a remote branch, push a local branch to the remote under the new branch name, then remove the old branch from the remote.'].
	oldName := oldHistorian shortName.
	newName := UIManager default request: 'New branch name' initialAnswer: oldName.
	(newName = oldName or: [newName isEmpty])
		ifTrue: [^ self].
	newHistorian := self newHistorianFor: oldHistorian repository named: newName onError: [^ self].
	newHistorian version notNil ifTrue:
		[UIManager default inform: 'Branch ', newName, ' already exists!'.
		^ self].
	newHistorian version: oldHistorian version.
	oldHistorian repository delete: oldHistorian.
	self projectSelection loadedHistorian = oldHistorian ifTrue:
		[self projectSelection loadedHistorian: newHistorian].
	self selectedHistorian: newHistorian.
	self loadBranchList].