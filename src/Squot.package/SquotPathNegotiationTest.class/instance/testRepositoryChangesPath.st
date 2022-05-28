tests
testRepositoryChangesPath
	| object |
	"given"
	object := Object new.
	store whenInitializingStoreInfoFor: object do: [:storeInfo | "nothing"].
	repository whenInitializingStoreInfoDo:
		[:snapshot :storeInfo | | path | path := storeInfo at: #path.
		(path endsWith: ' changed by repository')
			ifFalse: [storeInfo at: #path put: path, ' changed by repository']].
	"when"
	workingCopy add: object at: 'path'.
	"then"
	self assert: (store includesObjectAt: 'path changed by repository').