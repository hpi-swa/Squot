auto-merging
tryAutoMergeLeft: leftDefinition right: rightDefinition base: baseDefinition
	| allDefinitions allSources mergedDefinition mergedSources stamp |
	allDefinitions := {leftDefinition. rightDefinition. baseDefinition}.
	(allDefinitions anySatisfy: #isNil) ifTrue: [^ false].
	allSources := allDefinitions collect: #gitSSources.
	stamp := Utilities changeStamp.
	mergedSources := (1 to: leftDefinition gitSSourcesSize) collect: [:index |
		GSMergeUtilities
			stringMergeLeft: (allSources first at: index)
			right: (allSources second at: index)
			base: (allSources third at: index)
			ifConflict: [(leftDefinition gitSSourcesIsTimeStamp at: index)
							ifTrue: [stamp]
							ifFalse: [^ false]]].
	mergedDefinition := leftDefinition
		gitSCopyWithSources: mergedSources
		notifying: nil
		ifFail: [^ false].
	self addOperation: (MCModification of: leftDefinition to: mergedDefinition).
	^ true