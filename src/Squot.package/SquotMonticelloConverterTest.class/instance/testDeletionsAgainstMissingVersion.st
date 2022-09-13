tests
testDeletionsAgainstMissingVersion
	"When a version deletes classes and its parent version cannot be found in the repository,
	the deletions must still occur. There was a bug preventing that and the files remained."
	| package versionInfos first second third mcSnapshots theVersions mcRepo historian testedVersion firstSnapshot monticelloDifference packageArtifact |
	"given"
	package := MCPackage named: #Plonk.
	mcSnapshots := {
		firstSnapshot := MCSnapshot fromDefinitions: {
			MCClassDefinition name: #Griffle
				superclassName: #Object
				category: 'Plonk-Tests-Data' 
				instVarNames: #()
				classVarNames: #()
				poolDictionaryNames: #()
				classInstVarNames: #()
				comment:  ''}.
		(MCPatcher
			apply: (MCPatch operations:
						{MCAddition of:
							(MCMethodDefinition className: #Griffle
								selector: 'math'
								category: 'to be deleted'
								timeStamp: 'today'
								source: 'math Transcript show: 1 + 1')})
			to: firstSnapshot).
		MCSnapshot empty}.
	versionInfos := {(first := MCVersionInfo name: 'Plonk-squot.1' id: UUID new
			message: 'first' date: Date today time: Time now author: 'squot' ancestors: #()).
		(second := MCVersionInfo name: 'Plonk-squot.2' id: UUID new message: 'second'
			date: Date today time: Time now author: 'squit' ancestors: {first}).
		(third := MCVersionInfo name: 'Plonk-squot.3' id: UUID new message: 'third'
			date: Date today time: Time now author: 'squot' ancestors: {second})}.
	theVersions := versionInfos with: mcSnapshots collect: [:info :snapshot |
		MCVersion package: package info: info snapshot: snapshot].
	mcRepo := self newMcRepository: #Plonk.
	{theVersions first. theVersions third} do: [:each | mcRepo storeVersion: each].
	"when"
	converter convertMonticelloHistoryUpTo: theVersions last from: mcRepo
		asNewHistorianNamed: 'test' in: repository.
	"then"
	historian := repository historianNamed: 'test'.
	testedVersion := historian version.
	packageArtifact := testedVersion snapshot artifactAt: 'Plonk.package'.
	monticelloDifference := packageArtifact shadowOfTrackedObject asMCSnapshot
								patchRelativeToBase: theVersions last snapshot.
	self assert: monticelloDifference isEmpty description: 'there should be no difference'.