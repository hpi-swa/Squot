private
monticelloSnapshot: aClass
	^ MCSnapshot fromDefinitions:
		(Array streamContents:
			[:stream |
			stream nextPutAll: aClass classDefinitions.
			aClass selectorsDo: [:each | stream nextPut: (MethodReference class: aClass selector: each) asMethodDefinition]])