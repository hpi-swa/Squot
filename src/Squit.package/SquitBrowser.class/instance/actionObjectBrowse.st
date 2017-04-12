actions
actionObjectBrowse
	self objectSelection artifact content ifNotNil: [:content |
		(content isKindOf: MCSnapshot) ifTrue: [
			content definitions
				detect: [:each | each isClassDefinition]
				ifFound: [:clsDefinition |
					Smalltalk at: clsDefinition name ifPresent: [:cls | cls browse ]]
				ifNone: []]]