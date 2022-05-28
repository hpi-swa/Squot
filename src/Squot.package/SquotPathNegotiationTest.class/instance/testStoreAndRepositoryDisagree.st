tests
testStoreAndRepositoryDisagree
	| object |
	"given"
	object := Object new.
	store 
		whenInitializingStoreInfoFor: object
		do: [:storeInfo | | path | path := storeInfo at: #path.
			(path endsWith: ' changed by store')
				ifFalse: [storeInfo at: #path put: path, ' changed by store']].
	repository whenInitializingStoreInfoDo:
		[:snapshot :storeInfo | | path | path := storeInfo at: #path.
		(path endsWith: ' changed by repository')
			ifFalse: [storeInfo at: #path put: path, ' changed by repository']].
	"when"
	self should: [workingCopy add: object at: 'path'] raise: Error.