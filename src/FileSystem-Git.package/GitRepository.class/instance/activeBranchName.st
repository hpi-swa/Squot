accessing-objects
activeBranchName
	"Answers the name of the currently active branch which is the branch referenced in HEAD. This method can answer nil."

	| headContents headObject |
	
	headContents := self headFile readStreamDo: [ :stream | stream contents asString withBlanksTrimmed ].
	(headContents beginsWith: 'ref:')
		ifTrue: [ ^ headContents copyAfterLast: $/ ].
	
	headObject := self objectNamed: headContents.
	^ self branches keyAtValue: headObject ifAbsent: [ nil ]