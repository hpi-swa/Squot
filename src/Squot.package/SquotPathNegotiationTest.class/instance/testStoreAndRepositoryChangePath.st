tests
testStoreAndRepositoryChangePath
	| object |
	"given"
	object := Object new.
	store
		whenInitializingStoreInfoFor: object
		do: [:storeInfo | | path | path := storeInfo at: #path.
			(path includesSubstring: 'changed by store' caseSensitive: true)
				ifFalse: [storeInfo at: #path put: path, ' changed by store']].
	repository whenInitializingStoreInfoDo:
		[:shadow :storeInfo | | path | path := storeInfo at: #path.
		(path endsWith: ' and repository')
			ifFalse: [storeInfo at: #path put: path, ' and repository']].
	"when"
	workingCopy add: object at: 'path'.
	"then"
	self assert: (store includesObjectAt: 'path changed by store and repository').