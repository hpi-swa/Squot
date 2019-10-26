tests
testArtifactRemovalModifcationConflict
	| working incoming base merge node |
	"given"
	working := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions:
				{MCClassDefinition name: 'ChangedAndRemoved' superclassName: 'Object'
					category: 'ChangedAndRemoved' instVarNames: '' comment: 'A'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'ChangedAndRemoved'));
		buildSnapshot.
	incoming := SquotSnapshot empty.
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
		assert: 'ChangedAndRemoved.package (changed/removed)' equals: node title;
		assert: node needsChoice.