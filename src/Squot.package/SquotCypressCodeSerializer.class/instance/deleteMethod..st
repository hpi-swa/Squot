private
deleteMethod: aMCMethodDefinition
	| fileNameMap classifier |
	fileNameMap := cypressWriter fileNameMapFor: {aMCMethodDefinition}.
	classifier := definitions detect: [:each | each isClassDefinition and: [each className = aMCMethodDefinition className]] ifNone: [].
	classifier
		ifNotNil:
			[(cypressWriter fileUtils directory / (aMCMethodDefinition className, (classifier isTraitDefinition ifTrue: ['.trait'] ifFalse: ['.class'])) / (aMCMethodDefinition classIsMeta ifTrue: ['class'] ifFalse: ['instance']) / ((fileNameMap at: aMCMethodDefinition classIsMeta) at: aMCMethodDefinition selector), 'st')
				delete]
		ifNil: "extension method removed"
			[(cypressWriter fileUtils directory / (aMCMethodDefinition className, ('.extension')) / (aMCMethodDefinition classIsMeta ifTrue: ['class'] ifFalse: ['instance']) / ((fileNameMap at: aMCMethodDefinition classIsMeta) at: aMCMethodDefinition selector), 'st')
				delete]