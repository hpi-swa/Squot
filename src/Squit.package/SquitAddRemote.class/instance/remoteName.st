accessing
remoteName

	^ remoteName ifNil: [String empty] ifNotNil: [remoteName asString]