auto-merging
tryAutoMergeLeft: leftDefinition right: rightDefinition base: baseDefinition
	| allDefinitions allSources mergedDefinition mergedSources |
	allDefinitions := {leftDefinition. rightDefinition. baseDefinition}.
	(allDefinitions anySatisfy: #isNil) ifTrue: [^ false].
	allSources := allDefinitions collect: #squotSources.
	mergedSources := (1 to: leftDefinition squotSourcesSize) collect: [:index |
		(self mergeSourcesLeft: (allSources first at: index)
			right: (allSources second at: index)
			base: (allSources third at: index))
				ifNil: [^ false]].
	mergedDefinition := leftDefinition
		squotCopyWithSources: mergedSources
		notifying: nil
		ifFail: [^ false].
	self addOperation: (MCModification of: leftDefinition to: mergedDefinition).
	^ true