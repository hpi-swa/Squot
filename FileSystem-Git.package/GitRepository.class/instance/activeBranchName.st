accessing-objects
activeBranchName
"Answers the name of the currently active branch which is the branch referenced in HEAD. This method can answer nil."

	| headContents |
	headContents := self headFile readStreamDo: [ :stream | stream contents asString trimBoth ].
	(headContents beginsWith: 'ref:')
		ifTrue: [ ^ (headContents subStrings: '/') last ]
		ifFalse: [ ^ nil ]