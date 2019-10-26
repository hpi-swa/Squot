*Squot-Packages-Tests
testSmalltalkCodeDiffs
	| before after patch |
	before := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories: #('ChangedPackage-Core' 'ChangedPackage-Tests').
				MCClassDefinition name: 'ChangedClass' superclassName: 'Object'
					category: 'ChangedPackage-Core' instVarNames: '' comment: 'A'.
				MCMethodDefinition className: 'ChangedClass' selector: 'timeStamp'
					category: 'changed' timeStamp: 'A' source: 'timeStamp ^ nil'.
				MCClassDefinition name: 'OtherClass' superclassName: 'Object'
					category: 'ChangedPackage-Core' instVarNames: '' comment: ''.
				MCMethodDefinition className: 'OtherClass' selector: 'changedMethod'
					category: 'changed' timeStamp: '' source: 'changedMethod ^ $A'.
				MCClassDefinition name: 'RemovedClass' superclassName: 'TestCase'
					category: 'ChangedPackage-Tests' instVarNames: '' comment: ''.
				MCMethodDefinition className: 'RemovedClass' selector: 'deletedMethod'
					category: 'removed' timeStamp: '' source: 'deletedMethod ^ nil'.})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'ChangedPackage'));
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories: #('RemovedPackage').
				MCClassDefinition name: 'ClassA' superclassName: 'Object'
					category: 'RemovedPackage' instVarNames: '' comment: ''.
				MCMethodDefinition className: 'ClassA' selector: 'removed'
					category: 'removed' timeStamp: '' source: 'removed ^ nil'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'RemovedPackage'));
		buildSnapshot.
	after := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories: #('ChangedPackage-Core').
				MCClassDefinition name: 'ChangedClass' superclassName: 'Object'
					category: 'ChangedPackage-Core' instVarNames: 'newVar' comment: 'B'.
				MCMethodDefinition className: 'ChangedClass' selector: 'timeStamp'
					category: 'changed' timeStamp: 'B' source: 'timeStamp ^ nil'.
				MCClassDefinition name: 'OtherClass' superclassName: 'Object'
					category: 'ChangedPackage-Core' instVarNames: '' comment: ''.
				MCMethodDefinition className: 'OtherClass' selector: 'changedMethod'
					category: 'changed' timeStamp: '' source: 'changedMethod ^ $B'})
				asSquotArtifactForPackage: (PackageInfo named: 'ChangedPackage'));
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories: #('AddedPackage').
				MCClassDefinition name: 'ClassB' superclassName: 'Object'
					category: 'AddedPackage' instVarNames: '' comment: ''.
				MCMethodDefinition className: 'ClassB' selector: 'added'
					category: 'added' timeStamp: '' source: 'added ^ nil'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: 'AddedPackage'));
		buildSnapshot.
	patch := after patchRelativeToBase: before.
	self openToolAndTestOnPatch: patch.