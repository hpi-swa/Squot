private
checkForNonFastForwardUpdates: updateAssociations with: aRepository
	| fromToCommitPairs nonFastForwards pairsWithUnfetchedRemote properUpdates |
	properUpdates := updateAssociations select: [:update |
		(refs includesKey: update key)
		and: [(refs at: update key) ~= update value hexHash]].
	pairsWithUnfetchedRemote := OrderedCollection new.
	fromToCommitPairs := properUpdates
		collect: [:update |
			(aRepository objectNamed: (refs at: update key)
				ifAbsent: [pairsWithUnfetchedRemote add:
						(refs at: update key) -> update value.
					nil])
			-> update value]
		thenSelect: [:each | each key notNil].
	nonFastForwards := fromToCommitPairs reject: [:each | each key isAncestorOf: each value].
	(nonFastForwards isEmpty and: [pairsWithUnfetchedRemote isEmpty]) ifTrue: [^ self].
	GitNonFastForwardPushUpdatesDetected new
		repository: aRepository;
		updates: nonFastForwards, pairsWithUnfetchedRemote;
		signal: 'Attempting to update remote reference(s) in a non-fast-forward manner (forced push required)'.