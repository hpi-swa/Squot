tests
testRestoreAdheresToTheLoadOrder
	"When a snapshot is restored, the load order of its artifacts is considered."
	| snapshot materializedPaths |
	snapshot := SquotTestSnapshots snapshotWithChangedLoadOrder.
	materializedPaths := OrderedCollection new.
	snapshot artifacts do: [:each | each become: (SquotArtifactMock new
													path: each path;
													materializeBlock: [:mock |
														materializedPaths add: mock path];
													yourself)].
	"when"
	imageStore restoreToSnapshot: snapshot.
	"then"
	self assert: materializedPaths asArray = snapshot loadOrder asArray.
	self assert: imageStore loadOrder asArray = snapshot loadOrder asArray.