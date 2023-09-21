actions
actionMaterializeActiveCommit
	| commit |
	commit := self activeCommit ifNil: [^ self inform: 'Please select a commit first.'].
	self openDialogToMaterializeCommit: self activeCommit.