accessing
mergeOfRoot
	"Answer the merge of the graph instances."
	| graphMerge objectsWithChanges visited |
	graphMerge := merges at: self graphId ifAbsent:
		[^ SquotToggles useNewApi
			ifTrue: [SquotNoMerge of: working]
			ifFalse: [SquotObjectGraphMerge merge: incoming into: working basedOn: base  merges: #() additions: #() removals: #() conflicts: #()]].
	objectsWithChanges := OrderedCollection new.
	(merges values select: [:each | each ~~ graphMerge and: [each hasChanges]])
		do: [:each |
			graphMerge addMerge: each.
			objectsWithChanges add: (reflections at: each working undecorated)].
	visited := IdentitySet with: working. "do not process the graph itself"
	[objectsWithChanges isEmpty] whileFalse:
		[| each | each := objectsWithChanges removeFirst.
		(visited ifAbsentAdd: each object undecorated) ifTrue:
			[(referrers removeKey: each object undecorated ifAbsent: [#()])
				do: [:eachReferrerAssoc | | referrerMerge targetMerge referrerInIncoming |
					referrerMerge := (merges at: (working nameOf: eachReferrerAssoc key object undecorated)
						ifAbsent: [self isThisEverCalled]).
					targetMerge := merges at: (working nameOf: each object undecorated).
					referrerInIncoming := each mirror instanceOf: each object from: working path: eachReferrerAssoc value in: incoming ifAbsent: [].
					referrerMerge addReferenceDiff:
						(SquotDifferentReferenceTarget
							reference: eachReferrerAssoc value last
							leftOwner: eachReferrerAssoc key object target: each object
							rightOwner: referrerInIncoming target: targetMerge incoming).
					graphMerge addMerge: referrerMerge.
					(visited includes: eachReferrerAssoc key object undecorated)
						ifFalse: [objectsWithChanges add: eachReferrerAssoc key]]]].
	additions do: [:each | graphMerge addModification: each].
	removals do: [:each | graphMerge addModification: each].
	conflicts do: [:each | graphMerge addConflict: each].
	graphMerge updateResult.
	^ graphMerge