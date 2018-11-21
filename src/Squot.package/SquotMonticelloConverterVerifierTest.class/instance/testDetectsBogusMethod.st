tests
testDetectsBogusMethod
	| package versionInfo mcSnapshot theVersion mcRepo historian snapshot squotVersion |
	"given"
	package := MCPackage named: classFactory packageName.
	mcSnapshot := MCSnapshot fromDefinitions: {
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
	versionInfo := MCVersionInfo name: package name, '-squot.1' id: UUID new message: 'hooray' date: Date today time: Time now author: 'squot' ancestors: #().
	theVersion := MCVersion package: package info: versionInfo snapshot: mcSnapshot.
	mcRepo := MCDictionaryRepository new.
	mcRepo storeVersion: theVersion.
	snapshot := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions: mcSnapshot definitions allButLast,
				{MCMethodDefinition className: #Griffle
					selector: 'initialize'
					category: 'nil' "<-- here be difference"
					timeStamp: 'today'
					source: 'initialize'})
				asSquotArtifactForPackage: package packageInfo);
		buildSnapshot.
	squotVersion := repository createNewVersion: snapshot
		with: [:version | version message: 'hooray'; author: 'squot';
			timestamp: versionInfo timeStamp; parents: #()].
	historian := repository newHistorian: 'test' version: squotVersion.
	"when"
	self should: [verifier verify: historian hasCorrectConversionsUpTo: theVersion  whichComesFrom: mcRepo] raise: SquotMonticelloConversionProblem.