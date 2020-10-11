tests
testSnapshotIncludesLoadOrder
	| snapshot |
	"given"
	store add: (StringHolder new contents: '1') at: '1';
		add: (StringHolder new contents: '2') at: '2'.
	workingCopy loadOrder: store artifacts keys asArray reversed.
	"when"
	snapshot := workingCopy lazySnapshot.
	"then"
	self assert: snapshot loadOrder asArray = workingCopy loadOrder asArray.