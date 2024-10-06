ui
requestBranchNameFor: aString at: aCommit fromRef: aStringOrNil
	^ UIManager default
		request: ('Create {1} at {2}. Branch name:' format: {
					aString.
					aStringOrNil
						ifNotNil: [GitReference shortName: aStringOrNil]
						ifNil: [aCommit showOneLine]})
		initialAnswer: (aStringOrNil
							ifNil: ['']
							ifNotNilDo: [:ref |
								(self activeWorkingCopy isRemoteRef: ref)
									ifTrue: [self activeWorkingCopy remoteRefName: ref]
									ifFalse: [GitReference shortName: ref]]).