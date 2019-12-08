tests
testRepositoryChangesPath
	| object |
	"given"
	object := Object new.
	store when: object comesInValidatePathAs: [:path | path].
	repository whenValidatePathAnswer: [:snapshot :path | path, ' changed by repository'].
	"when"
	workingCopy add: object at: 'path'.
	"then"
	self assert: (store includesObjectAt: 'path changed by repository').