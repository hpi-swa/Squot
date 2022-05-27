tests
testStoreChangesPath
	| object |
	"given"
	object := Object new.
	store when: object comesInValidatePathAs:
		[:path |
		(path endsWith: ' changed by store')
			ifTrue: [path]
			ifFalse: [path, ' changed by store']].
	repository whenValidatePathAnswer: [:snapshot :path | path].
	"when"
	workingCopy add: object at: 'path'.
	"then"
	self assert: (store includesObjectAt: 'path changed by store').