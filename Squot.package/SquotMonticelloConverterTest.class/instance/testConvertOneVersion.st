as yet unclassified
testConvertOneVersion
	| package versionInfo mcSnapshot theVersion mcRepo historian |
	"given"
	package := MCPackage named: #Plonk.
	mcSnapshot := MCSnapshot fromDefinitions: {
		MCClassDefinition name: #Griffle
			superclassName: #Object
			category: 'Squot-Tools-Tests-Data' 
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
	versionInfo := MCVersionInfo name: 'Plonk-squot.1' id: UUID new message: 'hooray' date: Date today time: Time now author: 'squot' ancestors: #().
	theVersion := MCVersion package: package info: versionInfo snapshot: mcSnapshot.
	mcRepo := MCDictionaryRepository new.
	mcRepo storeVersion: theVersion.
	"when"
	converter convertMonticelloHistoryUpTo: theVersion from: mcRepo
		asNewHistorianNamed: 'test' in: repository.
	"then"
	self assert: (historian := repository historianNamed: 'test') notNil.
	self assert: historian version notNil.
	self assert: historian version message = 'hooray'.
	self assert: historian version parents isEmpty.
	self assert: (historian version metadata at: #author) = 'squot'.
	self assert: (historian version metadata at: #committer) = Utilities authorInitials. self flag: 'TODO: want proper names, right?'.
	self shouldnt: [historian version metadata at: #timestamp] raise: KeyNotFound.
	self assertVersion: historian version containsClass: (PseudoClass new name: #Griffle).
	self assertVersion: historian version containsMethod: (FakeMethod new methodClassName: #Griffle; selector: #initialize; source: 'initialize').