tests
testAcceptsCorrectConversionWithMultipleVersions
	| package versionInfos first mcSnapshots theVersions mcRepo snapshots squotVersions previous historian |
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
				comment:  ''.
			MCMethodDefinition className: #Griffle
				selector: 'initialize'
				category: 'initialize-release'
				timeStamp: 'today'
				source: 'initialize'}.
		MCSnapshot fromDefinitions: {
			MCClassDefinition name: #Griffle
				superclassName: #Object
				category: package name, '-Tests-Data' 
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
	versionInfos := {(first := MCVersionInfo name: package name, '-squot.1' id: UUID new
			message: 'hooray' date: Date today time: Time now author: 'squot' ancestors: #()).
		MCVersionInfo name: package name, '-squot.2' id: UUID new message: 'next'
			date: Date today time: Time now author: 'squit' ancestors: {first}}.
	theVersions := versionInfos with: mcSnapshots collect: [:info :snapshot |
		MCVersion package: package info: info snapshot: snapshot].
	mcRepo := self newMcRepository: classFactory packageName.
	theVersions do: [:each | mcRepo storeVersion: each].
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
	
	self shouldnt: [verifier verify: historian hasCorrectConversionsUpTo: theVersions last whichComesFrom: mcRepo] raise: SquotMonticelloConversionProblem.