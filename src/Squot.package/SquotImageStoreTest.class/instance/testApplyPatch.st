tests
testApplyPatch
	| className category packageInfo packageArtifactBeforePatch packageArtifactAfterPatch snapshotBefore patch class hashMethodBeforePatch |
	className := classFactory newName asSymbol.
	category := classFactory defaultCategory.
	packageInfo := self newPackageInfoFor: classFactory packageName.
	packageArtifactBeforePatch := (MCSnapshot fromDefinitions:
			{MCClassDefinition name: className
				superclassName: #Object
				category: category
				instVarNames: #()
				classVarNames: #()
				poolDictionaryNames: #()
				classInstVarNames: #()
				comment:  ''.
			MCMethodDefinition className: className
				selector: 'initialize'
				category: 'initialize-release'
				timeStamp: ''
				source: 'initialize'.
			MCMethodDefinition className: className
				selector: 'hash'
				category: 'comparing'
				timeStamp: ''
				source: 'hash ^ 0'})
		asSquotArtifactForPackage: packageInfo.
	snapshotBefore := SquotSnapshot builder
		add: packageArtifactBeforePatch;
		buildSnapshot.
	packageArtifactAfterPatch := (MCSnapshot fromDefinitions:
			{MCClassDefinition name: className
					superclassName: #Object
					category: category
					instVarNames: #()
					classVarNames: #()
					poolDictionaryNames: #()
					classInstVarNames: #()
					comment:  'We are all individuals.'.
				MCMethodDefinition className: className
					selector: 'hash'
					category: 'comparing'
					timeStamp: ''
					source: 'hash ^ 0'.
				MCMethodDefinition className: className
					selector: '='
					category: 'comparing'
					timeStamp: ''
					source: '= other ^ false'})
			asSquotArtifactForPackage: packageInfo.
	patch := snapshotBefore newPatchBuilder
		diff: packageArtifactBeforePatch against: packageArtifactAfterPatch;
		buildPatch.
	self suppressChangeNotificationsDuring:
		[imageStore restoreToSnapshot: snapshotBefore].
	packageInfo := imageStore objectAt: packageArtifactBeforePatch path.
	packageInfo workingCopy unregister. "clean up immediately..."
	class := testEnvironment at: className.
	hashMethodBeforePatch := class >> #hash.
	"when"
	self suppressChangeNotificationsDuring:
		[imageStore applyPatch: patch].
	"then"
	packageInfo workingCopy unregister. "clean up immediately..."
	self assert: class == (testEnvironment at: className).
	self assert: 'We are all individuals.' equals: class organization classComment asString.
	self deny: (class includesSelector: #initialize).
	self assert: (class includesSelector: #=).
	self assert: hashMethodBeforePatch equals: class >> #hash.