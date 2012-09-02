class-tests
testFromLooseStream
	| stream object loadedObject |
	GitStorableObject types do:
		[ :each | object := self buildMockFor: each.
			object store.
			stream := repository streamLooseObjectNamed: object hexHash.
			loadedObject := GitStorableObject fromLooseObjectStream: stream in: repository. 
			self assert: loadedObject isNil not.
			self assert: loadedObject class = (object class).
			self assert: loadedObject = object]