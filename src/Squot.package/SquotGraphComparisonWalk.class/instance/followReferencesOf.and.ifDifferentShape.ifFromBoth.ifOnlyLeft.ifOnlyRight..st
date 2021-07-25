enumerating
followReferencesOf: left and: right ifDifferentShape: replacementBlock ifFromBoth: commonRefBlock ifOnlyLeft: removalBlock ifOnlyRight: additionBlock
	| leftReflected rightReflected |
	leftReflected := SquotObjectReflection object: left mirror: (mirrors at: left undecorated).
	rightReflected := SquotObjectReflection object: right mirror: (mirrors at: right undecorated).
	((leftReflected isComparableTo: rightReflected) not
			or: [leftReflected canHaveReferences not
				or: [rightReflected canHaveReferences not]])
		ifTrue: [replacementBlock value]
		ifFalse:
			[(leftReflected references intersection: rightReflected references) do:
				[:each | | nextLeft nextRight |
				nextLeft := leftReflected reflect: each.
				nextRight := rightReflected reflect: each.
				mirrors at: nextLeft undecorated put: (leftReflected nextMirror: each);
					at: nextRight undecorated put: (rightReflected nextMirror: each).
				commonRefBlock value: nextLeft value: nextRight value: (walk currentPath copyWith: each)].
			(leftReflected references copyWithoutAll: rightReflected references) do:
				[:each | | oldTarget |
				oldTarget := leftReflected reflect: each. 
				mirrors at: oldTarget undecorated put: (leftReflected nextMirror: each).
				removalBlock value: oldTarget value: (walk currentPath copyWith: each)].
			(rightReflected references copyWithoutAll: leftReflected references) do:
				[:each | | newTarget |
				newTarget := rightReflected reflect: each.
				mirrors at: newTarget undecorated put: (rightReflected nextMirror: each).
				additionBlock value: newTarget value: (walk currentPath copyWith: each)]]