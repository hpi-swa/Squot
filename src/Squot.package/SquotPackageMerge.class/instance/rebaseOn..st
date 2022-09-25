merging
rebaseOn: aSquotPackageShadow
	| definitions baseDefinitions modifications conflicts |
	"(aSquotPackageShadow squotMergeWith: incoming basedOn: base) would not include the conflict resolutions"
	definitions := MCDefinitionIndex definitions: aSquotPackageShadow definitions.
	baseDefinitions := MCDefinitionIndex definitions: base definitions.
	modifications := Dictionary new.
	conflicts := Dictionary new.
	containerModifications do:
		[:each |
		each isAddition ifTrue:
			[definitions definitionLike: each definition
				ifPresent: "Turn to modification or conflict" [self notYetImplemented]
				ifAbsent: [modifications at: each definition description put: each]].
		each isRemoval ifTrue:
			[definitions definitionLike: each definition
				ifPresent: [:definition | modifications at: definition description put: (MCRemoval of: definition)]
				ifAbsent: ["Nothing to remove anymore"]].
		each isModification ifTrue:
			[definitions definitionLike: each definition
				ifPresent: "Check whether the original definitions are equal"
					[:definition | self notYetImplemented]
				ifAbsent: "Turn to conflict"
					[self notYetImplemented]]].
	(containerConflicts select: [:each | each localChosen not]) do: "Check whether still a conflict, turn to modifcation if not"
		[:each |
		each remoteChosen
			ifTrue: "Conflict was previously already resolved"
				[each operation isAddition ifTrue:
					[definitions definitionLike: each operation definition
						ifPresent:
							[:definition | definition ~= each operation definition ifTrue: [modifications at: definition description put: (MCModification of: definition to: each operation definition)]]
						ifAbsent: [modifications at: each operation description put: each operation]].
				each operation isRemoval ifTrue:
					[definitions definitionLike: each operation definition
						ifPresent: [:definition | modifications at: definition description put: (MCRemoval of: definition)]
						ifAbsent: ["Nothing to be removed anymore"]].
				each operation isModification ifTrue:
					[definitions definitionLike: each operation definition
						ifPresent: [:definition | definition ~= each operation definition ifTrue: [modifications at: definition description put: (MCModification of: definition to: each operation definition)]]
						ifAbsent: [modifications at: each operation description put: (MCAddition of: each operation definition)]]]
			ifFalse: "Conflict was previously not resolved"
				[self flag: #todo. "What if each localChosen?"
				each operation isAddition ifTrue: "was removed in previous working copy"
					[definitions definitionLike: each operation definition
						ifPresent: "Now it is present"
							[:definition |
							definition = each operation definition
								ifTrue: ["Nothing to change"]
								ifFalse: "Conflict or modification"
									[baseDefinitions definitionLike: definition
										ifPresent:
											[:baseDefinition |
											baseDefinition = definition
												ifTrue: [modifications at: each operation definition description put: each operation definition]
												ifFalse: [conflicts at: definition description put: (MCModification of: definition to: each operation definition)]]
										ifAbsent: [self error: 'Inconsistent state: if base does not have an edition of the definition, this should not have been a conflict before the rebase.']]]
						ifAbsent: "Still removed in working copy, so the conflict stays."
							[conflicts at: each operation definition description put: each]].
				each operation isRemoval ifTrue: "Previous working copy had it changed"
					[definitions definitionLike: each operation definition
						ifPresent: "Still conflict unless equal to base"
							[:definition |
							baseDefinitions definitionLike: definition
								ifPresent:
									[:baseDefinition |
									baseDefinition = definition
										ifTrue: [modifications at: definition description put: (MCRemoval of: definition)]
										ifFalse: [conflicts at: definition description put: (MCConflict operation: (MCRemoval of: definition))]]
								ifAbsent: [self error: 'Inconsistent state: if base does not have an edition of the definition, this should not have been a conflict before the rebase.']]
						ifAbsent: ["No need to remove something that is not there."]].
				each operation isModification ifTrue: "conflicting modifications or additions"
					[definitions definitionLike: each operation definition
						ifPresent: "Still conflict unless now equal to either base or incoming"
							[:definition |
							definition = each operation definition
								ifTrue: ["Nothing to change"]
								ifFalse:
									[baseDefinitions definitionLike: definition
										ifPresent:
											[:baseDefinition |
											baseDefinition = definition
												ifTrue: [modifications at: definition description put: (MCModification of: definition to: each operation definition)]
												ifFalse: [conflicts at: definition description put: (MCConflict operation: (MCModification of: definition to: each operation definition))]]
										ifAbsent: [conflicts at: definition description put: (MCConflict operation: (MCModification of: definition to: each operation definition))]]]
						ifAbsent: "Conflicting unless absent from base as well"
							[baseDefinitions definitionLike: each operation definition
								ifPresent:
									[:baseDefinition | conflicts at: each operation definition description put: (MCAddition of: each operation definition)]
								ifAbsent: [modifications at: each operation definition description put: (MCAddition of: each operation definition)]]]]].
	^ self class working: aSquotPackageShadow incoming: incoming base: base 
		modifications: modifications conflicts: conflicts