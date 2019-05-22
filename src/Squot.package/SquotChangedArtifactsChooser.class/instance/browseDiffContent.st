actions
browseDiffContent

	self selectedNode content ifNotNil: [:object |
		object definition isClassDefinition
			ifTrue: [object definition actualClass browse].
		object definition isMethodDefinition
			ifTrue: [ToolSet browse: object definition actualClass selector: object definition selector]].