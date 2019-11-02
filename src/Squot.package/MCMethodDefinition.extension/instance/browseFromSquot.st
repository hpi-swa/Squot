*Squot-tools
browseFromSquot
	^ self actualClass
		ifNotNil: [ToolSet browse: self actualClass selector: selector]
		ifNil: [(MCOperationsList operations: {MCAddition of: self}) browse]