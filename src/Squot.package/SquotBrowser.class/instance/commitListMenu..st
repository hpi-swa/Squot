menu
commitListMenu: aMenu
	self activeCommit ifNotNil: [:commit |
		aMenu addTitle: ('Commit {1}' format: {commit showOneLine printString})].
	^ self menu: aMenu forCommit: self activeCommit