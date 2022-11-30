tests
testConvertTwoPackages

	| package1 package2 versionInfo1 versionInfo2 mcSnapshot1 mcSnapshot2 theVersion1 theVersion2 mcRepo1 mcRepo2 mcRepoGroup historian parent1 parent2 parents |
	"given"
	package1 := MCPackage named: #Plonk.
	package2 := MCPackage named: #Nurp.
	mcSnapshot1 := MCSnapshot fromDefinitions: {
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
	mcSnapshot2 := MCSnapshot fromDefinitions: {
		MCClassDefinition name: #Wiffy
			superclassName: #Object
			category: 'Nurp-Tests-Data' 
			instVarNames: #()
			classVarNames: #()
			poolDictionaryNames: #()
			classInstVarNames: #()
			comment:  ''.
		MCMethodDefinition className: #Wiffy
			selector: 'initialize'
			category: 'initialize-release'
			timeStamp: 'today'
			source: 'initialize'}.
	versionInfo1 := MCVersionInfo name: 'Plonk-squot.1' id: UUID new message: 'hooray' date: Date today time: Time now author: 'squot' ancestors: #().
	versionInfo2 := MCVersionInfo name: 'Nurp-squot.1' id: UUID new message: 'Ay caramba!' date: Date today time: Time now author: 'squot' ancestors: #().
	theVersion1 := MCVersion package: package1 info: versionInfo1 snapshot: mcSnapshot1.
	theVersion2 := MCVersion package: package2 info: versionInfo2 snapshot: mcSnapshot2.
	mcRepo1 := self newMcRepository: #Plonk.
	mcRepo2 := self newMcRepository: #Nurp.
	mcRepo1 storeVersion: theVersion1.
	mcRepo2 storeVersion: theVersion2.
	mcRepoGroup := MCRepositoryGroup new
		addRepository: mcRepo1;
		addRepository: mcRepo2;
		yourself.
	
	"when"
	converter convertMonticelloHistoryUpToAll: {theVersion1. theVersion2} from: mcRepoGroup
		asNewHistorianNamed: 'test' in: repository.
	
	"then"
	self assert: (historian := repository historianNamed: 'test') notNil.
	self assert: historian version notNil.
	self assert: (historian version message includesSubstring: 'merge' caseSensitive: false).
	self assertVersion: historian version containsClass: (PseudoClass new name: #Griffle).
	self assertVersion: historian version containsMethod: (FakeMethod new methodClassName: #Griffle; selector: #initialize; source: 'initialize').
	self assertVersion: historian version containsClass: (PseudoClass new name: #Wiffy).
	self assertVersion: historian version containsMethod: (FakeMethod new methodClassName: #Wiffy; selector: #initialize; source: 'initialize').
	self assert: 2 equals: (parents := historian version parents) size.
	
	self assert: parents first notNil.
	self assert: 'hooray' equals: (parent1 := parents first) message.
	self assert: parent1 parents isEmpty.
	self assert: 'squot' equals: (parent1 metadata at: #author).
	self assertVersion: parent1 containsClass: (PseudoClass new name: #Griffle).
	self assertVersion: parent1 containsMethod: (FakeMethod new methodClassName: #Griffle; selector: #initialize; source: 'initialize').
	
	self assert: parents second notNil.
	self assert: 'Ay caramba!' equals: (parent2 := parents second) message.
	self assert: parent2 parents isEmpty.
	self assert: 'squot' equals: (parent2 metadata at: #author).
	self assertVersion: parent2 containsClass: (PseudoClass new name: #Wiffy).
	self assertVersion: parent2 containsMethod: (FakeMethod new methodClassName: #Wiffy; selector: #initialize; source: 'initialize').