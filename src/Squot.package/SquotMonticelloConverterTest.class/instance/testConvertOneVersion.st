tests
testConvertOneVersion
	| package versionInfo mcSnapshot theVersion mcRepo historian |
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
			comment:  ''.
		MCMethodDefinition className: #Griffle
			selector: 'initialize'
			category: 'initialize-release'
			timeStamp: 'today'
			source: 'initialize'}.
	versionInfo := MCVersionInfo name: 'Plonk-squot.1' id: UUID new message: 'hooray' date: Date today time: Time now author: 'squot' ancestors: #().
	theVersion := MCVersion package: package info: versionInfo snapshot: mcSnapshot.
	mcRepo := self newMcRepository: #Plonk.
	mcRepo storeVersion: theVersion.
	"when"
	converter convertMonticelloHistoryUpTo: theVersion from: mcRepo
		asNewHistorianNamed: 'test' in: repository.
	"then"
	self assert: (historian := repository historianNamed: 'test') notNil.
	self assert: historian version notNil.
	self assert: historian version message = 'hooray'.
	self assert: historian version parents isEmpty.
	self assert: 'squot' equals: (historian version metadata at: #author).
	self assert: (historian version metadata at: #committer) notEmpty.
	self shouldnt: [historian version metadata at: #timestamp] raise: KeyNotFound.
	self assert: '' equals: (historian version metadata at: #email ifAbsent: ['']) description: 'no email address should be set because MCVersionInfo has no field for it'.
	self assertVersion: historian version containsClass: (PseudoClass new name: #Griffle).
	self assertVersion: historian version containsMethod: (FakeMethod new methodClassName: #Griffle; selector: #initialize; source: 'initialize').