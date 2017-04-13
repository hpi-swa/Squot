actions
actionBranchRename
	| newHistorian newName oldHistorian oldName |
	self branchSelection ifNil: [^ self].
	oldHistorian := self branchSelection historian.
	oldName := oldHistorian name.
	newName := UIManager default request: 'New branch name' initialAnswer: oldName.
	(newName = oldName or: [newName isEmpty])
		ifTrue: [^ self].
	newHistorian := self projectSelection repository historianNamed: newName.
	newHistorian version notNil ifTrue:
		[UIManager default inform: 'Branch ', newName, ' already exists!'.
		^ self].
	newHistorian version: oldHistorian version.
	self projectSelection repository delete: oldHistorian.
	self refresh.