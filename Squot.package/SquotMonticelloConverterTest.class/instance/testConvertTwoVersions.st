as yet unclassified
testConvertTwoVersions
	| package versionInfos first mcSnapshots theVersions mcRepo historian testedVersion |
	"given"
	package := MCPackage named: #Plonk.
	mcSnapshots := {
		MCSnapshot fromDefinitions: {
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
		MCSnapshot fromDefinitions: {
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
				source: 'initialize Transcript show: 1 + 1'}}.
	versionInfos := {(first := MCVersionInfo name: 'Plonk-squot.1' id: UUID new
			message: 'hooray' date: Date today time: Time now author: 'squot' ancestors: #()).
		MCVersionInfo name: 'Plonk-squot.2' id: UUID new message: 'next'
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
	self assert: testedVersion message = 'next'.
	self assert: testedVersion parents size = 1.
	self assert: (testedVersion metadata at: #author) = 'squit'.
	self assert: (testedVersion metadata at: #committer) = Utilities authorInitials. self flag: 'TODO: want proper names, right?'.
	self shouldnt: [testedVersion metadata at: #timestamp] raise: KeyNotFound.
	self assertVersion: testedVersion containsClass: (PseudoClass new name: #Griffle).
	self assertVersion: testedVersion containsMethod: (FakeMethod new methodClassName: #Griffle; selector: #initialize; source: 'initialize Transcript show: 1 + 1').
	testedVersion := testedVersion parents first.
	self assert: testedVersion message = 'hooray'.
	self assert: testedVersion parents isEmpty.
	self assert: (testedVersion metadata at: #author) = 'squot'.
	self assert: (testedVersion metadata at: #committer) = Utilities authorInitials. self flag: 'TODO: want proper names, right?'.
	self shouldnt: [testedVersion metadata at: #timestamp] raise: KeyNotFound.
	self assertVersion: testedVersion containsClass: (PseudoClass new name: #Griffle).
	self assertVersion: testedVersion containsMethod: (FakeMethod new methodClassName: #Griffle; selector: #initialize; source: 'initialize').