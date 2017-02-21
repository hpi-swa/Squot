tests
testCanHandleMissingMCVersions
	| package versionInfos first second mcSnapshots theVersions mcRepo snapshots squotVersions previous historian |
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
				comment:  ''}.
		MCSnapshot fromDefinitions: {
			MCClassDefinition name: #Griffle
				superclassName: #Object
				category: 'Plonk-Tests-Data' 
				instVarNames: #(a)
				classVarNames: #()
				poolDictionaryNames: #()
				classInstVarNames: #()
				comment:  ''}.
		MCSnapshot fromDefinitions: {
			MCClassDefinition name: #Griffle
				superclassName: #Object
				category: 'Plonk-Tests-Data' 
				instVarNames: #(a b)
				classVarNames: #()
				poolDictionaryNames: #()
				classInstVarNames: #()
				comment:  ''}}.
	versionInfos := {(first := MCVersionInfo name: 'Plonk-squot.1' id: UUID new
			message: 'first' date: Date today time: Time now author: 'squot' ancestors: #()).
		(second := MCVersionInfo name: 'Plonk-squit.2' id: UUID new message: 'second'
			date: Date today time: Time now author: 'squit' ancestors: {first}).
		MCVersionInfo name: 'Plonk-squit.3' id: UUID new message: 'third'
			date: Date today time: Time now author: 'squit' ancestors: {second}}.
	theVersions := versionInfos with: mcSnapshots collect: [:info :snapshot |
		MCVersion package: package info: info snapshot: snapshot].
	mcRepo := MCDictionaryRepository new.
	(theVersions copyWithout: theVersions second) do: [:each | mcRepo storeVersion: each].
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
	
	self shouldnt: [verifier verify: historian hasCorrectConversionsUpTo: theVersions last whichComesFrom: mcRepo] raise: SquotMonticelloConversionProblem, Error.