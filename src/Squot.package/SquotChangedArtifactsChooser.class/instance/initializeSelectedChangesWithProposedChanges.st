initialize-release
initializeSelectedChangesWithProposedChanges
	proposed do: [:each | self addToEffectiveUnlessIgnored: each].