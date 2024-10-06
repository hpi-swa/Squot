menu
refTypeName: aStringOrNil
	aStringOrNil ifNil: [^ 'commit'].
	(self activeWorkingCopy isSqueakBranchRef: aStringOrNil) ifTrue: [^ 'branch'].
	(self activeWorkingCopy isRemoteRef: aStringOrNil) ifTrue: [^ 'remote-tracking branch'].
	^ 'ref'