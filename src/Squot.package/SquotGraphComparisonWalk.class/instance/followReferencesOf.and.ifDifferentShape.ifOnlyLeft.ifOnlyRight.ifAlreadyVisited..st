enumerating
followReferencesOf: left and: right ifDifferentShape: replacementBlock ifOnlyLeft: removalBlock ifOnlyRight: additionBlock ifAlreadyVisited: multiPathBlock
	| leftReflected rightReflected |
	self deprecated.
	leftReflected := SquotObjectReflection object: left mirror: (mirrors at: left).
	rightReflected := SquotObjectReflection object: right mirror: (mirrors at: right).
	((leftReflected isComparableTo: rightReflected) not
			or: [leftReflected references isEmpty
				and: [rightReflected references isEmpty]])
		ifTrue: [replacementBlock value]
		ifFalse: [
			walk checkPathsTo: left ifMultiple: [multiPathBlock value];
				checkPathsTo: right ifMultiple: [multiPathBlock value].
			(leftReflected references intersection: rightReflected references) do:
				[:each | | nextLeft nextRight |
				nextLeft := leftReflected reflect: each.
				nextRight := rightReflected reflect: each.
				mirrors at: nextLeft undecorated put: (leftReflected nextMirror: each);
					at: nextRight undecorated put: (rightReflected nextMirror: each).
				walk
					add: {nextLeft. nextRight}
					reachedVia: each].
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