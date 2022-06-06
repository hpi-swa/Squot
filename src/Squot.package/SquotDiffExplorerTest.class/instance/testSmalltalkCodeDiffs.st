*Squot-Tests-Packages
testSmalltalkCodeDiffs
	| before after changedClass otherClass removedClass classA classB patch |
	classFactory := ClassFactoryForTestCase new.
	SystemChangeNotifier uniqueInstance doSilently:
		[changedClass := classFactory newClassInCategory: 'ChangedPackage'.
		changedClass compileSilently: 'timeStamp ^ nil'.
		otherClass := classFactory newClassInCategory: 'ChangedPackage'.
		otherClass compileSilently: 'changedMethod ^ $A'.
		removedClass := classFactory newClassInCategory: 'ChangedPackage'.
		removedClass compileSilently: 'deletedMethod ^ nil'.
		classA := classFactory newClassInCategory: 'RemovedPackage'.
		classA compileSilently: 'removed ^ nil'.
		classB := classFactory newClassInCategory: 'AddedPackage'.
		classB compileSilently: 'added ^ nil'].
	before := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories:
					{classFactory packageName, '-', 'ChangedPackage-Core'.
					classFactory packageName, '-', 'ChangedPackage-Tests'}.
				MCClassDefinition name: changedClass name superclassName: 'Object'
					category: classFactory packageName, '-', 'ChangedPackage-Core' 
					instVarNames: '' comment: 'A'.
				MCMethodDefinition className: changedClass name selector: 'timeStamp'
					category: 'changed' timeStamp: 'A' source: 'timeStamp ^ nil'.
				MCClassDefinition name: otherClass name superclassName: 'Object'
					category: classFactory packageName, '-', 'ChangedPackage-Core' instVarNames: '' comment: ''.
				MCMethodDefinition className: otherClass name selector: 'changedMethod'
					category: 'changed' timeStamp: '' source: 'changedMethod ^ $A'.
				MCClassDefinition name: removedClass name superclassName: 'TestCase'
					category: classFactory packageName, '-', 'ChangedPackage-Tests' instVarNames: '' comment: ''.
				MCMethodDefinition className: removedClass name selector: 'deletedMethod'
					category: 'removed' timeStamp: '' source: 'deletedMethod ^ nil'.})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: classFactory packageName, '-', 'ChangedPackage'));
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories: #('RemovedPackage').
				MCClassDefinition name: classA name superclassName: 'Object'
					category: classFactory packageName, '-', 'RemovedPackage' instVarNames: '' comment: ''.
				MCMethodDefinition className: classA name selector: 'removed'
					category: 'removed' timeStamp: '' source: 'removed ^ nil'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: classFactory packageName, '-', 'RemovedPackage'));
		buildSnapshot.
	after := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories:
					{classFactory packageName, '-', 'ChangedPackage-Core'}.
				MCClassDefinition name: changedClass name superclassName: 'Object'
					category: classFactory packageName, '-', 'ChangedPackage-Core' instVarNames: #('newVar') comment: 'B'.
				MCMethodDefinition className: changedClass name selector: 'timeStamp'
					category: 'changed' timeStamp: 'B' source: 'timeStamp ^ nil'.
				MCClassDefinition name: otherClass name superclassName: 'Object'
					category: classFactory packageName, '-', 'ChangedPackage-Core' instVarNames: '' comment: ''.
				MCMethodDefinition className: otherClass name selector: 'changedMethod'
					category: 'changed' timeStamp: '' source: 'changedMethod ^ $B'})
				asSquotArtifactForPackage: (PackageInfo named: classFactory packageName, '-', 'ChangedPackage'));
		add: ((MCSnapshot fromDefinitions:
				{MCOrganizationDefinition categories: #('AddedPackage').
				MCClassDefinition name: classB name superclassName: 'Object'
					category: classFactory packageName, '-', 'AddedPackage' instVarNames: '' comment: ''.
				MCMethodDefinition className: classB name selector: 'added'
					category: 'added' timeStamp: '' source: 'added ^ nil'})
				asSquotArtifactForPackage:
					(PackageInfo new packageName: classFactory packageName, '-', 'AddedPackage'));
		buildSnapshot.
	patch := after patchRelativeToBase: before.
	workingCopy
		add: (PackageInfo new packageName: classFactory packageName, '-', 'ChangedPackage') at: classFactory packageName, '-', 'ChangedPackage.package';
		add: (PackageInfo new packageName: classFactory packageName, '-', 'RemovedPackage') at: classFactory packageName, '-', 'RemovedPackage.package';
		add: (PackageInfo new packageName: classFactory packageName, '-', 'AddedPackage') at: classFactory packageName, '-', 'AddedPackage.package'.
	self openToolAndTestOnPatch: patch.