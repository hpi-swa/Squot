tests
withoutTimestamps: aMCSnapshot
	^ MCSnapshot fromDefinitions:
		(aMCSnapshot definitions collect:
			[:each | each isMethodDefinition
						ifTrue: [MCMethodDefinition
									className: each className
									classIsMeta: each classIsMeta
									selector: each selector
									category: each category
									timeStamp: nil
									source: each source]
						ifFalse: [each]])