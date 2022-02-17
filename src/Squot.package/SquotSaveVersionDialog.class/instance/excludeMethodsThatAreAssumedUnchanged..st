actions
excludeMethodsThatAreAssumedUnchanged: aCollection
	| packageNodes |
	packageNodes := ((aCollection select: [:each | each artifactDiff notNil]) select: [:each | each content isModification and: [each content object storeInfo objectClassName = #PackageInfo]]).
	packageNodes do: [:eachPackage |
		eachPackage children do: [:eachClass |
			[eachClass content isCurrentlyIgnoredInSquot
				ifTrue: [eachClass withAllChildren"Nodes" do: [:each | each exclude]]
				ifFalse: [eachClass children
						select: [:each | each content isCurrentlyIgnoredInSquot]
						thenDo: [:each | each exclude].
					eachClass hasActiveChildren ifFalse: [eachClass exclude]]]
				on: MessageNotUnderstood do:
					[:error | error message selector == #isCurrentlyIgnoredInSquot
						ifTrue: [error resume: false]
						ifFalse: [error pass]]]].