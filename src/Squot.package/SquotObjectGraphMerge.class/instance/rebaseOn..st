merging
rebaseOn: aSquotShadowGraph
	| merges additions removals conflicts |
	"^ self class into: aSquotShadowGraph merge: incoming basedOn: base?"
	merges := Dictionary new.
	additions := Dictionary new.
	removals := Dictionary new.
	conflicts := Dictionary new.
	containerModifications keysAndValuesDo:
		[:name :each |
		each isAddition ifTrue:
			[(aSquotShadowGraph includesObjectNamed: name)
				ifFalse: [additions at: name put: each]
				ifTrue: "Turn addition into a merge (or the name is nil)"
					[self notYetImplemented].
		each isRemoval ifTrue:
			[(aSquotShadowGraph includesObjectNamed: name)
				ifTrue: [removals at: name put: each]
				ifFalse: ["Nothing to remove"]]]].
	elementMerges keysAndValuesDo:
		[:name :each |
		(aSquotShadowGraph includesObjectNamed: name)
			ifTrue:
				[| newMerge |
				newMerge := each rebaseOn: (aSquotShadowGraph shadowNamed: name).
				merges at: name put: newMerge]
			ifFalse: "Merge removal in the new working copy with possible changes."
				[self notYetImplemented]].
	containerConflicts do: "Check whether they are still conflicts, if not turn to addition, removal or merge, otherwise rebase."
		[:each | self notYetImplemented].
	^ self class
		merge: incoming into: aSquotShadowGraph basedOn: working
		merges: merges additions: additions removals: removals conflicts: conflicts