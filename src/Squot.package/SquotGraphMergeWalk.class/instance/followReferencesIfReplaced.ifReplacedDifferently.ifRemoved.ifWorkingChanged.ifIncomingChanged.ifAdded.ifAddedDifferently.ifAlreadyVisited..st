enumerating
followReferencesIfReplaced: opaqueReplacementBlock ifReplacedDifferently: opaqueConflictBlock ifRemoved: removalBlock ifWorkingChanged: incomingRemovalConflictBlock ifIncomingChanged: workingRemovalConflictBlock ifAdded: additionBlock ifAddedDifferently: additionConflictBlock ifAlreadyVisited: multiPathBlock
	workingReflected := incomingReflected := baseReflected := nil.
	workingReflected := SquotReflectedObject mirror: (thisContext objectClass: latestWorking) squotMirror object: latestWorking.
	incomingReflected := SquotReflectedObject mirror: (thisContext objectClass: latestIncoming) squotMirror object: latestIncoming.
	baseReflected := SquotReflectedObject mirror: (thisContext objectClass: latestBase) squotMirror object: latestBase.
	((workingReflected isComparableTo: incomingReflected) not
		or: 
			[workingReflected references isEmpty
				and: [incomingReflected references isEmpty]])
		ifTrue: 
			[latestBase = latestWorking
				ifTrue: [opaqueReplacementBlock value: walk currentPath]
				ifFalse: [opaqueConflictBlock value: walk currentPath]]
		ifFalse: 
			[walk
				checkPathsTo: latestWorking ifMultiple: [multiPathBlock value];
				checkPathsTo: latestIncoming ifMultiple: [multiPathBlock value].
			self followCommonReferencesIfAdditionsConflict: additionConflictBlock.
			self followReferencesNotInIncoming: removalBlock ifChangedInWorking: incomingRemovalConflictBlock.
			self followReferencesNotInWorking: additionBlock ifChangedInIncoming: workingRemovalConflictBlock].