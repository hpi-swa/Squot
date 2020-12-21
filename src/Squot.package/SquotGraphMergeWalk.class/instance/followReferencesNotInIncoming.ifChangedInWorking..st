private
followReferencesNotInIncoming: removalBlock ifChangedInWorking: incomingRemovalConflictBlock
	(workingReflected references copyWithoutAll: incomingReflected references) do: 
		[:each |
		(baseReflected references includes: each)
			ifFalse: ["leave added"]
			ifTrue: 
				[(baseReflected reflect: each) = (workingReflected reflect: each)
					ifTrue: [removalBlock value: (workingReflected reflect: each) value: (walk currentPath copyWith: each)]
					ifFalse: 
						[incomingRemovalConflictBlock
							value: (workingReflected reflect: each)
							value: (baseReflected reflect: each)
							value: (walk currentPath copyWith: each)]]].