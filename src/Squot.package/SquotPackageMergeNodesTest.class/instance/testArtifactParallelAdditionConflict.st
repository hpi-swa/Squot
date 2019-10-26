tests
testArtifactParallelAdditionConflict
	| working incoming base merge node |
	"given"
	working := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions:
				{MCClassDefinition name: 'AddedByBoth' superclassName: 'Object'
					category: 'AddedByBoth' instVarNames: '' comment: 'A'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'AddedByBoth'));
		buildSnapshot.
	incoming := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions:
				{MCClassDefinition name: 'AddedByBoth' superclassName: 'Object'
					category: 'AddedByBoth' instVarNames: '' comment: 'B'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'AddedByBoth'));
		buildSnapshot.
	base := SquotSnapshot empty.
	merge := SquotMerge into: working merge: incoming basedOn: base.
	"when"
	node := merge elementMerges anyOne asDiffTree.
	"then"
	self assert: node content == (merge mergeAt: 'AddedByBoth.package');
		assert: 'AddedByBoth.package' equals: node title;
		assert: node needsChoice.