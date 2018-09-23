testing
testSelectPreservesLoadOrder
	"When a new builder is created from a snapshot, it must preserve the load order."
	| artifact1 artifact2 newSnapshot |
	artifact1 := SquotArtifact new
					path: 'artifact1';
					yourself.
	artifact2 := SquotArtifact new
					path: 'artifact2';
					yourself.
	(snapshot := SquotSnapshot new)
		artifacts: (Dictionary new
					at: artifact1 path put: artifact1;
					at: artifact2 path put: artifact2;
					yourself);
		loadOrder: snapshot artifacts keys reversed.
	"when"
	newSnapshot := snapshot select: [:each | true].
	"then"
	self assert: newSnapshot loadOrder asArray = snapshot loadOrder asArray.