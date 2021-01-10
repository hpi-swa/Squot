private
followCommonReferencesIfAdditionsConflict: additionConflictBlock
	(workingReflected references intersection: incomingReflected references) do: 
		[:each |
		(baseReflected references includes: each)
			ifTrue: 
				[walk add: {(workingReflected reflect: each).
						(incomingReflected reflect: each).
						(baseReflected reflect: each)}
					reachedVia: each]
			ifFalse: 
				["Would have to go into detail with the differences here and each of them would be conflicts"
				(workingReflected reflect: each) = (incomingReflected reflect: each)
					ifTrue: ["in agreement"]
					ifFalse: 
						[additionConflictBlock
							value: (workingReflected reflect: each)
							value: (incomingReflected reflect: each)
							value: (walk currentPath copyWith: each)]]].