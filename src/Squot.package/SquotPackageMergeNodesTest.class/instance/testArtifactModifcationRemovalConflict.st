tests
testArtifactModifcationRemovalConflict
	| working incoming base merge node |
	"given"
	working := SquotSnapshot empty.
	incoming := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions:
				{MCClassDefinition name: 'ChangedAndRemoved' superclassName: 'Object'
					category: 'ChangedAndRemoved' instVarNames: '' comment: 'A'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'ChangedAndRemoved'));
		buildSnapshot.
	base := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions:
				{MCClassDefinition name: 'ChangedAndRemoved' superclassName: 'Object'
					category: 'ChangedAndRemoved' instVarNames: '' comment: 'C'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'ChangedAndRemoved'));
		buildSnapshot.
	merge := SquotMerge into: working merge: incoming basedOn: base.
	"when"
	node := merge containerConflicts anyOne asDiffTree.
	"then"
	self assert: node content == (merge conflictAt: 'ChangedAndRemoved.package');
		assert: 'ChangedAndRemoved.package (removed/changed)' equals: node title;
		assert: node needsChoice.