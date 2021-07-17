private
followCommonReferencesIfAdditionsConflict: additionConflictBlock
	| nextWorking nextIncoming nextBase |
	(workingReflected references intersection: incomingReflected references) do: 
		[:each |
		(baseReflected references includes: each)
			ifTrue: 
				[walk add: {nextWorking := workingReflected reflect: each.
						nextIncoming := incomingReflected reflect: each.
						nextBase := baseReflected reflect: each}
					reachedVia: each.
				mirrors at: nextWorking put: (workingReflected nextMirror: each);
					at: nextIncoming put: (incomingReflected nextMirror: each);
					at: nextBase put: (baseReflected nextMirror: each)]
			ifFalse: 
				["Would have to go into detail with the differences here and each of them would be conflicts"
				(workingReflected reflect: each) = (incomingReflected reflect: each)
					ifTrue: ["in agreement"]
					ifFalse: 
						[additionConflictBlock
							value: (workingReflected reflect: each)
							value: (incomingReflected reflect: each)
							value: (walk currentPath copyWith: each)]]].