tests
testStoreAndRepositoryDisagree
	| object |
	"given"
	object := Object new.
	store when: object comesInValidatePathAs: [:path | path, ' changed by store'].
	repository whenValidatePathAnswer: [:snapshot :path | path, ' changed by repository'].
	"when"
	self should: [workingCopy add: object at: 'path'] raise: Error.