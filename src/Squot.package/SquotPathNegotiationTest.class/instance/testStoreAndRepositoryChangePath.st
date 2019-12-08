tests
testStoreAndRepositoryChangePath
	| object |
	"given"
	object := Object new.
	store when: object comesInValidatePathAs:
		[:path |
		(path includesSubstring: 'changed by store' caseSensitive: true)
			ifFalse: [path, ' changed by store']
			ifTrue: [path]].
	repository whenValidatePathAnswer: [:snapshot :path | path, ' and repository'].
	"when"
	workingCopy add: object at: 'path'.
	"then"
	self assert: (store includesObjectAt: 'path changed by store and repository').