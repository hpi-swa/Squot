tests
testCanHandleMissingMCVersions
	| package versionInfos first second mcSnapshots theVersions mcRepo snapshots squotVersions previous historian |
	"given"
	package := MCPackage named: classFactory packageName.
	mcSnapshots := {
		MCSnapshot fromDefinitions: {
			MCClassDefinition name: #Griffle
				superclassName: #Object
				category: package name, '-Tests-Data' 
				instVarNames: #()
				classVarNames: #()
				poolDictionaryNames: #()
				classInstVarNames: #()
				comment:  ''}.
		MCSnapshot fromDefinitions: {
			MCClassDefinition name: #Griffle
				superclassName: #Object
				category: package name, '-Tests-Data' 
				instVarNames: #(a)
				classVarNames: #()
				poolDictionaryNames: #()
				classInstVarNames: #()
				comment:  ''}.
		MCSnapshot fromDefinitions: {
			MCClassDefinition name: #Griffle
				superclassName: #Object
				category: package name, '-Tests-Data' 
				instVarNames: #(a b)
				classVarNames: #()
				poolDictionaryNames: #()
				classInstVarNames: #()
				comment:  ''}}.
	versionInfos := {(first := MCVersionInfo name: package name, '-squot.1' id: UUID new
			message: 'first' date: Date today time: Time now author: 'squot' ancestors: #()).
		(second := MCVersionInfo name: package name, '-squit.2' id: UUID new message: 'second'
			date: Date today time: Time now author: 'squit' ancestors: {first}).
		MCVersionInfo name: package name, '-squit.3' id: UUID new message: 'third'
			date: Date today time: Time now author: 'squit' ancestors: {second}}.
	theVersions := versionInfos with: mcSnapshots collect: [:info :snapshot |
		MCVersion package: package info: info snapshot: snapshot].
	mcRepo := self newMcRepository: classFactory packageName.
	(theVersions copyWithout: theVersions second) do: [:each | mcRepo storeVersion: each].
	snapshots := mcSnapshots collect: [:each | SquotSnapshot builder
		add: (each asSquotArtifactForPackage: package packageInfo);
		buildSnapshot].
	previous := nil.
	squotVersions := versionInfos
		with: snapshots
		collect: [:versionInfo :snapshot | previous := repository
				createNewVersion: snapshot
				with: [:version | version message: versionInfo message;
					author: versionInfo author; 	timestamp: versionInfo timeStamp;
					parents: (previous ifNil: [#()] ifNotNil: [Array with: previous])]].
	historian := repository newHistorian: 'test' version: squotVersions last.
	
	self shouldnt: [verifier verify: historian hasCorrectConversionsUpTo: theVersions last whichComesFrom: mcRepo] raise: SquotMonticelloConversionProblem, Error.