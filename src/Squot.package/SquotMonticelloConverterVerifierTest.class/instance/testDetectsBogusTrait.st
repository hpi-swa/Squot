tests
testDetectsBogusTrait
	| package versionInfo mcSnapshot theVersion mcRepo historian snapshot squotVersion |
	"given"
	package := MCPackage named: classFactory packageName.
	mcSnapshot := MCSnapshot
		fromDefinitions: {MCTraitDefinition name: #Griffle
			traitComposition: ''
			category: package name, '-Tests-Data'
			comment:  'I am very useful, maybe.'
			commentStamp: ''}.
	versionInfo := MCVersionInfo name: package name, '-squot.1' id: UUID new message: 'hooray' date: Date today time: Time now author: 'squot' ancestors: #().
	theVersion := MCVersion package: package info: versionInfo snapshot: mcSnapshot.
	mcRepo := self newMcRepository: classFactory packageName.
	mcRepo storeVersion: theVersion.
	snapshot := SquotSnapshot builder
		add: ((MCSnapshot
				fromDefinitions: {MCTraitDefinition name: #Griffle
					traitComposition: ''
					category: package name, '-Tests-Data'
					comment:  '' "<-- here be difference"
					commentStamp: ''})
				asSquotArtifactForPackage: package packageInfo);
		buildSnapshot.
	squotVersion := repository createNewVersion: snapshot
		with: [:version | version message: 'hooray'; author: 'squot';
			timestamp: versionInfo timeStamp; parents: #()].
	historian := repository newHistorian: 'test' version: squotVersion.
	"when"
	self should: [verifier verify: historian hasCorrectConversionsUpTo: theVersion  whichComesFrom: mcRepo] raise: SquotMonticelloConversionProblem.