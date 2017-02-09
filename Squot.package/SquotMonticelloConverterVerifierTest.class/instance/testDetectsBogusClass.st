tests
testDetectsBogusClass
	| package versionInfo mcSnapshot theVersion mcRepo historian snapshot squotVersion |
	"given"
	package := MCPackage named: #Plonk.
	mcSnapshot := MCSnapshot fromDefinitions: {
		MCClassDefinition name: #Griffle
			superclassName: #Object
			category: 'Plonk-Tests-Data' 
			instVarNames: #()
			classVarNames: #()
			poolDictionaryNames: #()
			classInstVarNames: #()
			comment:  ''}.
	versionInfo := MCVersionInfo name: 'Plonk-squot.1' id: UUID new message: 'hooray' date: Date today time: Time now author: 'squot' ancestors: #().
	theVersion := MCVersion package: package info: versionInfo snapshot: mcSnapshot.
	mcRepo := MCDictionaryRepository new.
	mcRepo storeVersion: theVersion.
	snapshot := SquotSnapshot builder
		add: (SquotArtifact new
			content: (MCSnapshot
				fromDefinitions: {MCClassDefinition name: #Griffle
					superclassName: #Object
					category: 'Plonk-Tests-Data-Whoops' "<-- here be difference"
					instVarNames: #()
					classVarNames: #()
					poolDictionaryNames: #()
					classInstVarNames: #()
					comment:  ''});
			path: package name, '.package';
			initializeDefaultStoreInfoFor: package packageInfo;
			yourself);
		buildSnapshot.
	squotVersion := repository createNewVersion: snapshot
		with: [:version | version message: 'hooray'; author: 'squot';
			timestamp: versionInfo timeStamp; parents: #()].
	historian := repository newHistorian: 'test' version: squotVersion.
	"when"
	self should: [verifier verify: historian hasCorrectConversionsUpTo: theVersion  whichComesFrom: mcRepo] raise: SquotMonticelloConversionProblem.