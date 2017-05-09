actions
createNewBranchAt: aVersion
	| name newHistorian |
	name := UIManager default request: 'New branch name'.
	(name isNil or: [name isEmpty]) ifTrue: [^ false].
	newHistorian := self projectSelection repository newHistorian: name version: aVersion.
	"if the active branch is new and a new branch was created from it, activate the new one"
	(aVersion isNil and: [self projectSelection loadedHistorian version isNil])
		ifTrue: [self projectSelection loadedHistorian: newHistorian].
	^ true