enumerating
followReferencesOf: left and: right ifDifferentShape: replacementBlock ifOnlyLeft: removalBlock ifOnlyRight: additionBlock ifAlreadyVisited: multiPathBlock
	| leftMirror rightMirror leftRefs rightRefs |
	leftMirror := (thisContext objectClass: left) squotMirror.
	rightMirror := (thisContext objectClass: right) squotMirror.
	(leftMirror ~= rightMirror
			or: [(leftRefs := leftMirror referencesFrom: left) isEmpty
				and: [(rightRefs := rightMirror referencesFrom: right) isEmpty]])
		ifTrue: [replacementBlock value: walk currentPath]
		ifFalse: [
			walk checkPathsTo: left ifMultiple: [multiPathBlock value];
				checkPathsTo: right ifMultiple: [multiPathBlock value].
			leftRefs ifNil: [leftRefs := leftMirror referencesFrom: left].
			rightRefs ifNil: [rightRefs := rightMirror referencesFrom: right].
			(leftRefs intersection: rightRefs) do:
				[:each |
				walk
					add: {leftMirror reflect: each of: left. rightMirror reflect: each of: right} 
					reachedVia: each].
			(leftRefs copyWithoutAll: rightRefs) do:
				[:each | removalBlock value: (leftMirror reflect: each of: left) value: (walk currentPath copyWith: each)].
			(rightRefs copyWithoutAll: leftRefs) do:
				[:each | additionBlock value: (rightMirror reflect: each of: right) value: (walk currentPath copyWith: each)]]