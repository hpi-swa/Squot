*Squot-tools
browseFromSquot
	^ self actualClass
		ifNotNil: [:class | ToolSet browseClass: class]
		ifNil: [(MCOperationsList operations: {MCAddition of: self}) browse]
		