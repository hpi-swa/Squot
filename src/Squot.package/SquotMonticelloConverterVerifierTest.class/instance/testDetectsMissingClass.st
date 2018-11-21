tests
testDetectsMissingClass
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
		MCClassDefinition name: #ClassThatIsGoingToBeMissing
			superclassName: #Object
			category: package name, '-Tests-Data' 
			instVarNames: #()
			classVarNames: #()
			poolDictionaryNames: #()
			classInstVarNames: #()
			comment:  ''}.
	versionInfo := MCVersionInfo name: package name, '-squot.1' id: UUID new message: 'hooray' date: Date today time: Time now author: 'squot' ancestors: #().
	theVersion := MCVersion package: package info: versionInfo snapshot: mcSnapshot.
	mcRepo := MCDictionaryRepository new.
	mcRepo storeVersion: theVersion.
	snapshot := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions: mcSnapshot definitions allButLast)
				asSquotArtifactForPackage: package packageInfo);
		buildSnapshot.
	squotVersion := repository createNewVersion: snapshot
		with: [:version | version message: 'hooray'; author: 'squot';
			timestamp: versionInfo timeStamp; parents: #()].
	historian := repository newHistorian: 'test' version: squotVersion.
	"when"
	self should: [verifier verify: historian hasCorrectConversionsUpTo: theVersion  whichComesFrom: mcRepo] raise: SquotMonticelloConversionProblem.