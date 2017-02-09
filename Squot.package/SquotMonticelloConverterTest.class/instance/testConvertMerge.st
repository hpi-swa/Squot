tests
testConvertMerge
	| package versionInfos first second mcSnapshots theVersions mcRepo historian testedVersion |
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
			MCClassDefinition name: #Plonk
				superclassName: #Object
				category: 'Plonk-Tests-Data' 
				instVarNames: #()
				classVarNames: #()
				poolDictionaryNames: #()
				classInstVarNames: #()
				comment:  ''.
			MCMethodDefinition className: #Plonk
				selector: 'initialize'
				category: 'initialize-release'
				timeStamp: 'today'
				source: 'initialize'}.
		MCSnapshot fromDefinitions: {
			MCClassDefinition name: #Plonk
				superclassName: #Object
				category: 'Plonk-Tests-Data' 
				instVarNames: #()
				classVarNames: #()
				poolDictionaryNames: #()
				classInstVarNames: #()
				comment:  ''.
			MCMethodDefinition className: #Plonk
				selector: 'initialize'
				category: 'initialize-release'
				timeStamp: 'today'
				source: 'initialize'.
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
				source: 'initialize'}}.
	versionInfos := {(first := MCVersionInfo name: 'Plonk-squot.1' id: UUID new
			message: 'first' date: Date today time: Time now author: 'squot' ancestors: #()).
		(second := MCVersionInfo name: 'Plonk-squit.1' id: UUID new message: 'second'
			date: Date today time: Time now author: 'squit' ancestors: #()).
		MCVersionInfo name: 'Plonk-squot.2' id: UUID new message: 'merge'
			date: Date today time: Time now author: 'squit' ancestors: {first. second}}.
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
	self assert: testedVersion message = 'merge'.
	self assert: testedVersion parents size = 2.
	self assertVersion: testedVersion containsClass: (PseudoClass new name: #Griffle).
	self assertVersion: testedVersion containsClass: (PseudoClass new name: #Plonk).
	testedVersion parents first
		in: [:version |
			self assert: version message = 'first'.
			self assert: version parents isEmpty.
			self assertVersion: version containsClass: (PseudoClass new name: #Griffle)].
	testedVersion parents second
		in: [:version |
			self assert: version message = 'second'.
			self assert: version parents isEmpty.
			self assertVersion: version containsClass: (PseudoClass new name: #Plonk)].
	