*Squot-Packages-Tests
testSmalltalkCodeMerge
	"Covers the following nodes:
	- conflicting organization modification
	- conflicting class modification
	- conflicting method modification
	- conflicting method timestamp modification
	- clean duplicate class removal
	- clean duplicate method removal
	- clean duplicate package removal
	- conflicting removal and modification of package
	- conflicting removal and modification of class
	- conflicting removal and modification of method
	- clean duplicate addition of package, with conflict underneath
	- clean duplicate class addition, with conflict underneath
	- clean duplicate method addition
	- conflicting duplicate method additon"
	| before after base merge |
	before := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories: #('ChangedPackage' 'ChangedPackage-A').
				MCClassDefinition name: 'ChangedClass' superclassName: 'Object'
					category: 'ChangedPackage-A' instVarNames: 'a' comment: 'A'.
				MCMethodDefinition className: 'ChangedClass' selector: 'timeStamp'
					category: 'conflicts' timeStamp: 'A' source: 'timeStamp ^ nil'.
				MCMethodDefinition className: 'OtherClass' selector: 'changedMethod'
					category: 'conflicts' timeStamp: '' source: 'changedMethod ^ a'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'ChangedPackage'));
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories: #('AddedInBoth').
				MCClassDefinition name: 'AddedInBoth' superclassName: 'Object'
					category: 'AddedInBoth' instVarNames: '' comment: ''.
				MCMethodDefinition className: 'AddedInBoth' selector: 'added'
					category: 'added' timeStamp: '' source: 'added ^ nil'.
				MCMethodDefinition className: 'AddedInBoth' selector: 'addedDifferently'
					category: 'conflicts' timeStamp: '' source: 'addedDifferently ^ $A'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'AddedInBoth'));
		buildSnapshot.
	after := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories: #('ChangedPackage' 'ChangedPackage-B').
				MCClassDefinition name: 'ChangedClass' superclassName: 'Object'
					category: 'ChangedPackage-B' instVarNames: 'b' comment: 'B'.
				MCMethodDefinition className: 'ChangedClass' selector: 'timeStamp'
					category: 'conflicts' timeStamp: 'B' source: 'timeStamp ^ nil'.
				MCMethodDefinition className: 'OtherClass' selector: 'changedMethod'
					category: 'conflicts' timeStamp: '' source: 'changedMethod ^ b'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'ChangedPackage'));
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories: #('AddedInBoth').
				MCClassDefinition name: 'AddedInBoth' superclassName: 'Object'
					category: 'AddedInBoth' instVarNames: '' comment: ''.
				MCMethodDefinition className: 'AddedInBoth' selector: 'added'
					category: 'added' timeStamp: '' source: 'added ^ nil'.
				MCMethodDefinition className: 'AddedInBoth' selector: 'addedDifferently'
					category: 'conflicts' timeStamp: '' source: 'addedDifferently ^ $B'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'AddedInBoth'));
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories: #('ChangedAndRemoved').
				MCClassDefinition name: 'ChangedAndRemoved' superclassName: 'Object'
					category: 'ChangedAndRemoved' instVarNames: '' comment: 'A'.
				MCMethodDefinition className: 'ChangedAndRemoved' selector: 'changed'
					category: 'conflicts' timeStamp: '' source: 'changed ^ $A'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'ChangedAndRemoved'));
		buildSnapshot.
	base := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories: #('ChangedPackage' 'ChangedPackage-C').
				MCClassDefinition name: 'ChangedClass' superclassName: 'Object'
					category: 'ChangedPackage-C' instVarNames: 'c' comment: 'C'.
				MCMethodDefinition className: 'ChangedClass' selector: 'timeStamp'
					category: 'conflicts' timeStamp: 'C' source: 'timeStamp ^ nil'.
				MCMethodDefinition className: 'OtherClass' selector: 'changedMethod'
					category: 'conflicts' timeStamp: '' source: 'changedMethod ^ c'.
				MCClassDefinition name: 'RemovedInBoth' superclassName: 'Object'
					category: 'ChangedPackage' instVarNames: '' comment: ''.
				MCMethodDefinition className: 'RemovedInBoth' selector: 'removed'
					category: 'removed' timeStamp: '' source: 'removed ^ nil'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'ChangedPackage'));
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories: #('RemovedInBoth')})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'RemovedInBoth'));
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories: #('ChangedAndRemoved').
				MCClassDefinition name: 'ChangedAndRemoved' superclassName: 'Object'
					category: 'ChangedAndRemoved' instVarNames: '' comment: 'C'.
				MCMethodDefinition className: 'ChangedAndRemoved' selector: 'changed'
					category: 'conflicts' timeStamp: '' source: 'changed ^ $C'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'ChangedAndRemoved'));
		buildSnapshot.
	merge := SquotMerge into: before merge: after basedOn: base.
	self openToolAndTestOn: merge.