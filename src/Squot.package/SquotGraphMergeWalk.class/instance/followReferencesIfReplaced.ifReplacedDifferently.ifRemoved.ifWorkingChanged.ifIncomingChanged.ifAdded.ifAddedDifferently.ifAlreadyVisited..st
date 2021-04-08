enumerating
followReferencesIfReplaced: opaqueReplacementBlock ifReplacedDifferently: opaqueConflictBlock ifRemoved: removalBlock ifWorkingChanged: incomingRemovalConflictBlock ifIncomingChanged: workingRemovalConflictBlock ifAdded: additionBlock ifAddedDifferently: additionConflictBlock ifAlreadyVisited: multiPathBlock
	workingReflected := incomingReflected := baseReflected := nil.
	workingReflected := SquotObjectReflection object: latestWorking mirror: (mirrors at: latestWorking).
	incomingReflected := SquotObjectReflection object: latestIncoming mirror: (mirrors at: latestIncoming).
	baseReflected := SquotObjectReflection object: latestBase mirror: (mirrors at: latestBase).
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