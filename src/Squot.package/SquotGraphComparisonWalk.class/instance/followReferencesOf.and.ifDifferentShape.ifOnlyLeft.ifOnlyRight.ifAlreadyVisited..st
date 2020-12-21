enumerating
followReferencesOf: left and: right ifDifferentShape: replacementBlock ifOnlyLeft: removalBlock ifOnlyRight: additionBlock ifAlreadyVisited: multiPathBlock
	| leftReflected rightReflected |
	leftReflected := SquotObjectReflection object: left mirror: (thisContext objectClass: left) squotMirror.
	rightReflected := SquotObjectReflection object: right mirror: (thisContext objectClass: right) squotMirror.
	((leftReflected isComparableTo: rightReflected) not
			or: [leftReflected references isEmpty
				and: [rightReflected references isEmpty]])
		ifTrue: [replacementBlock value: walk currentPath]
		ifFalse: [
			walk checkPathsTo: left ifMultiple: [multiPathBlock value];
				checkPathsTo: right ifMultiple: [multiPathBlock value].
			(leftReflected references intersection: rightReflected references) do:
				[:each |
				walk
					add: {leftReflected reflect: each. rightReflected reflect: each} 
					reachedVia: each].
			(leftReflected references copyWithoutAll: rightReflected references) do:
				[:each | removalBlock value: (leftReflected reflect: each) value: (walk currentPath copyWith: each)].
			(rightReflected references copyWithoutAll: leftReflected references) do:
				[:each | additionBlock value: (rightReflected reflect: each) value: (walk currentPath copyWith: each)]]