actions on versions
actionCommitTag
	| taggedVersion workingCopy |
	(self hasProjectSelection and: [self hasCommitSelection]) ifFalse: [^ self].
	taggedVersion := self commitSelection.
	workingCopy := self projectSelection.
	self withUnitOfWork:
		[| tagName tagHistorian |
		tagName := SquotGUI request: 'New tag name' initialAnswer: ''.
		(tagName isNil or: [tagName isEmpty]) ifTrue: [^ self].
		tagHistorian := self newHistorianFor: workingCopy repository named: 'refs/tags/', tagName onError: [^ self].
		tagHistorian version ifNotNil:
			[tagHistorian version = taggedVersion "tag already exists with same commit"
				ifTrue: [^ self]
				ifFalse: [(self confirm: ('Tag {1} already exists. Do you wish to overwrite it?' translated format: {tagName})) ifFalse: [^ self]]].
		tagHistorian version: taggedVersion].