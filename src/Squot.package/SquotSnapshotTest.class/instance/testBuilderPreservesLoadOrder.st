testing
testBuilderPreservesLoadOrder
	"When a new snapshot is created with the builder, the load order is remembered in the snapshot."
	| artifact1 artifact2 |
	artifact1 := SquotArtifact new
					path: 'artifact1';
					yourself.
	artifact2 := SquotArtifact new
					path: 'artifact2';
					yourself.
	snapshot := SquotSnapshot builder
					add: artifact1;
					add: artifact2;
					buildSnapshot.
	self assert: snapshot loadOrder asArray = #('artifact1' 'artifact2')