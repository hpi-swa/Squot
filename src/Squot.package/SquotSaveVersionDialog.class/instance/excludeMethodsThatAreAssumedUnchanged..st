actions
excludeMethodsThatAreAssumedUnchanged: aCollection
	aCollection do: [:eachPackage |
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