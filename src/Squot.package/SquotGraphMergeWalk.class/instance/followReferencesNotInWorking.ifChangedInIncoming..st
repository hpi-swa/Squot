private
followReferencesNotInWorking: additionBlock ifChangedInIncoming: workingRemovalConflictBlock
	(incomingReflected references copyWithoutAll: workingReflected references) do: 
		[:each |
		(baseReflected references includes: each)
			ifTrue: 
				[(baseReflected reflect: each) = (incomingReflected reflect: each)
					ifTrue:  ["leave removed"]
					ifFalse: 
						[workingRemovalConflictBlock
							value: (incomingReflected reflect: each)
							value: (baseReflected reflect: each)
							value: (walk currentPath copyWith: each)]]
			ifFalse: [additionBlock value: (incomingReflected reflect: each) value: (walk currentPath copyWith: each)]].