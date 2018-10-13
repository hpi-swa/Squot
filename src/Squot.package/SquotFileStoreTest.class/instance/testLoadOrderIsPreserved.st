tests
testLoadOrderIsPreserved
	| snapshot |
	snapshot := SquotTestSnapshots snapshotWithChangedLoadOrder.
	"when"
	fileStore restoreToSnapshot: snapshot.
	"then"
	"have to cut away the pseudo-artifact for untracked files"
	self assert: (fileStore captureLazySnapshot loadOrder first: snapshot loadOrder size) asArray = snapshot loadOrder asArray.