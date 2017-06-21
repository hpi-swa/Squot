actions
createNewBranchAt: aVersion ifCanceled: cancelBlock
	"Create a new historian and answer it, or invoke the cancelBlock when the prompt for a branch name is canceled."
	| name newHistorian |
	name := UIManager default request: 'New branch name'.
	(name isNil or: [name isEmpty]) ifTrue: [^ cancelBlock value].
	newHistorian := self projectSelection repository newHistorian: name version: aVersion.
	"if the active branch is new and a new branch was created from it, activate the new one"
	(aVersion isNil and: [self projectSelection loadedHistorian version isNil])
		ifTrue: [self projectSelection loadedHistorian: newHistorian].
	^ newHistorian