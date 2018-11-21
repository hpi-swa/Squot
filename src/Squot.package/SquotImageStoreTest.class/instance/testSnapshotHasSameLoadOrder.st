tests
testSnapshotHasSameLoadOrder
	| snapshot |
	imageStore
		add: Object new at: 'object1';
		add: Object new at: 'object2'.
	"force a loadOrder that is not incidentally reproduced by the 'ordering' of the dictionary keys"
	imageStore loadOrder: imageStore objectPaths.
	imageStore loadOrder swap: 1 with: 2.
	snapshot := imageStore captureSnapshot.
	self assert: snapshot loadOrder asArray = imageStore loadOrder asArray.