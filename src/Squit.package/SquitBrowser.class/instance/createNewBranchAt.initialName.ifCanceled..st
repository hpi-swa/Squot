actions
createNewBranchAt: aVersion initialName: aString ifCanceled: cancelBlock
	"Create a new historian and answer it, or invoke the cancelBlock when the prompt for a branch name is canceled."
	| name newHistorian workingCopy |
	workingCopy := self projectSelection.
	name := SquotGUI request: 'New branch name' initialAnswer: aString.
	(name isNil or: [name isEmpty]) ifTrue: [^ cancelBlock value].
	newHistorian := self newHistorianFor: workingCopy repository named: name onError: cancelBlock.
	newHistorian version ifNotNil:
		[newHistorian version = aVersion
			ifTrue: ["nothing to be changed here" ^ newHistorian]
			ifFalse: [(self confirm: ('Branch {1} already exists. Do you wish to overwrite it?' format: {name})) ifFalse: [^ cancelBlock value]]].
	newHistorian version: aVersion.
	"if the active branch is new and a new branch was created from it, activate the new one"
	(aVersion isNil and: [self projectSelection loadedHistorian version isNil])
		ifTrue: [self projectSelection loadedHistorian: newHistorian].
	"If the branch could not be updated, cancel."
	newHistorian version ifNil: [^ cancelBlock value].
	^ newHistorian