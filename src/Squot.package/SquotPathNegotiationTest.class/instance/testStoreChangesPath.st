tests
testStoreChangesPath
	| object |
	"given"
	object := Object new.
	store
		whenInitializingStoreInfoFor: object
		do: [:storeInfo | | path | path := storeInfo at: #path.
			(path endsWith: ' changed by store')
				ifFalse: [storeInfo at: #path put: path, ' changed by store']].
	repository whenInitializingStoreInfoDo: [:shadow :storeInfo | "nothing"].
	"when"
	workingCopy add: object at: 'path'.
	"then"
	self assert: (store includesObjectAt: 'path changed by store').