private loading
mcSnapshotForSingleClass: aClass
	aClass ifNil: [^ MCSnapshot empty].
	^ MCSnapshot fromDefinitions: (Array streamContents: [:stream |
		stream nextPutAll: aClass classDefinitions.
		self flag: 'Currently no support for extensions like ContextS2 because PackageInfo is not used'.
		aClass methodsDo: [:each | stream nextPut:
			(MethodReference class: aClass selector: each selector) asMethodDefinition]])