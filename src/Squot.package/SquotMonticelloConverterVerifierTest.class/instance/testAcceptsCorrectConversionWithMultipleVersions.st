tests
testAcceptsCorrectConversionWithMultipleVersions
	| package versionInfos first mcSnapshots theVersions mcRepo snapshots squotVersions previous historian |
	"given"
	package := MCPackage named: #Plonk.
	mcSnapshots := {
		MCSnapshot fromDefinitions: {
			MCClassDefinition name: #Griffle
				superclassName: #Object
				category: 'Plonk-Tests-Data' 
				instVarNames: #()
				classVarNames: #()
				poolDictionaryNames: #()
				classInstVarNames: #()
				comment:  ''.
			MCMethodDefinition className: #Griffle
				selector: 'initialize'
				category: 'initialize-release'
				timeStamp: 'today'
				source: 'initialize'}.
		MCSnapshot fromDefinitions: {
			MCClassDefinition name: #Griffle
				superclassName: #Object
				category: 'Plonk-Tests-Data' 
				instVarNames: #()
				classVarNames: #()
				poolDictionaryNames: #()
				classInstVarNames: #()
				comment:  ''.
			MCMethodDefinition className: #Griffle
				selector: 'initialize'
				category: 'initialize-release'
				timeStamp: 'today'
				source: 'initialize Transcript show: 1 + 1'}}.
	versionInfos := {(first := MCVersionInfo name: 'Plonk-squot.1' id: UUID new
			message: 'hooray' date: Date today time: Time now author: 'squot' ancestors: #()).
		MCVersionInfo name: 'Plonk-squot.2' id: UUID new message: 'next'
			date: Date today time: Time now author: 'squit' ancestors: {first}}.
	theVersions := versionInfos with: mcSnapshots collect: [:info :snapshot |
		MCVersion package: package info: info snapshot: snapshot].
	mcRepo := MCDictionaryRepository new.
	theVersions do: [:each | mcRepo storeVersion: each].
	snapshots := mcSnapshots collect: [:each | SquotSnapshot builder
		add: (SquotArtifact new
			content: each;
			path: package name, '.package';
			initializeDefaultStoreInfoFor: package packageInfo;
			yourself);
		buildSnapshot].
	squotVersions := versionInfos
		with: snapshots
		collect: [:versionInfo :snapshot | previous := repository
				createNewVersion: snapshot
				with: [:version | version message: versionInfo message;
					author: versionInfo author; 	timestamp: versionInfo timeStamp;
					parents: (previous ifNil: [#()] ifNotNil: [Array with: previous])]].
	historian := repository newHistorian: 'test' version: squotVersions last.
	
	self shouldnt: [verifier verify: historian hasCorrectConversionsUpTo: theVersions last whichComesFrom: mcRepo] raise: SquotMonticelloConversionProblem.