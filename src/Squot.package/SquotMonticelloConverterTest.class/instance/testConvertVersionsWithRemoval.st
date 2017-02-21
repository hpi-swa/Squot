tests
testConvertVersionsWithRemoval
	| package versionInfos first mcSnapshots theVersions mcRepo historian testedVersion |
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
				comment:  ''.
			MCMethodDefinition className: #Griffle
				selector: 'initialize'
				category: 'initialize-release'
				timeStamp: 'today'
				source: 'initialize'}.
		MCSnapshot fromDefinitions: {
			MCClassDefinition name: #Griffle
				superclassName: #Object
				category: 'Plonk-Tests-Data' 
				instVarNames: #()
				classVarNames: #()
				poolDictionaryNames: #()
				classInstVarNames: #()
				comment:  ''}}.
	versionInfos := {(first := MCVersionInfo name: 'Plonk-squot.1' id: UUID new
			message: 'first' date: Date today time: Time now author: 'squot' ancestors: #()).
		MCVersionInfo name: 'Plonk-squot.2' id: UUID new message: 'second'
			date: Date today time: Time now author: 'squit' ancestors: {first}}.
	theVersions := versionInfos with: mcSnapshots collect: [:info :snapshot |
		MCVersion package: package info: info snapshot: snapshot].
	mcRepo := MCDictionaryRepository new.
	theVersions do: [:each | mcRepo storeVersion: each].
	"when"
	converter convertMonticelloHistoryUpTo: theVersions last from: mcRepo
		asNewHistorianNamed: 'test' in: repository.
	"then"
	self assert: (historian := repository historianNamed: 'test') notNil.
	self assert: (testedVersion := historian version) notNil.
	self assert: testedVersion message = 'second'.
	self assertVersion: testedVersion containsClass: (PseudoClass new name: #Griffle).
	self assertVersion: testedVersion doesNotContainMethod: (FakeMethod new methodClassName: #Griffle; selector: #initialize).
	testedVersion := testedVersion parents first.
	self assert: testedVersion message = 'first'.
	self assertVersion: testedVersion containsClass: (PseudoClass new name: #Griffle).
	self assertVersion: testedVersion containsMethod: (FakeMethod new methodClassName: #Griffle; selector: #initialize; source: 'initialize').