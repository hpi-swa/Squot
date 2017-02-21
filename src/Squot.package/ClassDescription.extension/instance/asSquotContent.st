*Squot
asSquotContent
	self flag: #hack.
	^ MCSnapshot fromDefinitions: (Array streamContents: [:stream |
		stream nextPutAll: self classDefinitions.
		self selectorsDo: [:each | stream nextPut: (MethodReference class: self selector: each) asMethodDefinition]])