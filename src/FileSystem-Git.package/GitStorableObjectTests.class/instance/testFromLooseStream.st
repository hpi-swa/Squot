class-tests
testFromLooseStream
	| stream loadedObject |
	GitStorableObject allSubclasses
		reject: [ :class | class isAbstract or: [ class = GitLightweightTag ] ]
		thenDo: [ :each || object |
			object := self buildMockFor: each.
			object store.
			stream := self looseObjectStream: object.
			loadedObject := GitStorableObject fromLooseObjectStream: stream in: repository. 
			self assert: loadedObject isNil not.
			self assert: loadedObject class = (object class).
			self assert: loadedObject = object ]