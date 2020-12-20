enumerating
followReferencesOf: working and: incoming basedOn: base ifOpaqueDifference: opaqueReplacementBlock ifOpaqueConflict: opaqueConflictBlock ifAdditionConflict: additionConflictBlock ifRemovedInIncoming: removalBlock ifChangedInWorkingButRemovedInIncoming: incomingRemovalConflictBlock ifRemovedInWorkingButChangedInIncoming: workingRemovalConflictBlock ifOnlyIncoming: additionBlock ifAlreadyVisited: multiPathBlock
	| workingMirror incomingMirror baseMirror workingRefs incomingRefs baseRefs |
	workingMirror := (thisContext objectClass: working) squotMirror.
	incomingMirror := (thisContext objectClass: incoming) squotMirror.
	baseMirror := (thisContext objectClass: base) squotMirror.
	(workingMirror ~= incomingMirror
			or: [(workingRefs := workingMirror referencesFrom: working) isEmpty
				and: [(incomingRefs := incomingMirror referencesFrom: incoming) isEmpty]])
		ifTrue:
			[base = working
				ifTrue: [opaqueReplacementBlock value: walk currentPath]
				ifFalse: [opaqueConflictBlock value: walk currentPath]]
		ifFalse: 
			[walk checkPathsTo: working ifMultiple: [multiPathBlock value];
				checkPathsTo: incoming ifMultiple: [multiPathBlock value].
			workingRefs ifNil: [workingRefs := workingMirror referencesFrom: working].
			incomingRefs ifNil: [incomingRefs := incomingMirror referencesFrom: incoming].
			baseRefs := baseMirror referencesFrom: base.
			(workingRefs intersection: incomingRefs) do:
				[:each |
				(baseRefs includes: each)
					ifTrue:
						[walk
							add: {workingMirror reflect: each of: working. incomingMirror reflect: each of: incoming. baseMirror reflect: each of: base}
							reachedVia: each]
					ifFalse:
						["Would have to go into detail with the differences here and each of them would be conflicts"
						(workingMirror reflect: each of: working) = (incomingMirror reflect: each of: incoming)
							ifTrue: ["in agreement"]
							ifFalse: [additionConflictBlock value: (workingMirror reflect: each of: working) value: (incomingMirror reflect: each of: incoming) value: (walk currentPath copyWith: each)]]].
			(workingRefs copyWithoutAll: incomingRefs) do:
				[:each |
				(baseRefs includes: each)
					ifFalse: ["leave added"]
					ifTrue:
						[(baseMirror reflect: each of: base) = (workingMirror reflect: each of: working)
							ifTrue: [removalBlock value: (workingMirror reflect: each of: working) value: (walk currentPath copyWith: each)]
							ifFalse: [incomingRemovalConflictBlock value: (workingMirror reflect: each of: working) value: (baseMirror reflect: each of: base) value: (walk currentPath copyWith: each)]]].
			(incomingRefs copyWithoutAll: workingRefs) do:
				[:each |
				(baseRefs includes: each)
					ifTrue:
						[(baseMirror reflect: each of: base) = (incomingMirror reflect: each of: incoming)
							ifTrue: ["leave removed"]
							ifFalse: [workingRemovalConflictBlock value: (incomingMirror reflect: each of: incoming) value: (baseMirror reflect: each of: base) value: (walk currentPath copyWith: each)]]
					ifFalse: [additionBlock value: (incomingMirror reflect: each of: incoming) value: (walk currentPath copyWith: each)]]]