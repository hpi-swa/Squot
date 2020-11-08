merging
resolvedPatch
	| modifiedObject |
	resolvedPatchBlock ifNotNil: [^ resolvedPatchBlock value].
	modifiedObject := hasConflicts == false
		ifTrue: [incoming]
		ifFalse:
			[choice caseOf:
				{[#incoming] -> [incoming ifNil: [self error: 'incoming not initialized']].
				[#working] -> [working ifNil: [self error: 'working not initialized']]}
				otherwise: [self error: 'Mock merge not resolved']].
	^ SquotDiffMock new whenAppliedReturn: modifiedObject