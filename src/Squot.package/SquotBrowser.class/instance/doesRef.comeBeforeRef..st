ui
doesRef: a comeBeforeRef: b
	| workingCopy |
	workingCopy := self activeWorkingCopy.
	{[:ref | workingCopy headRefName = ref].
	[:ref | workingCopy isSqueakRef: ref].
	[:ref | workingCopy isRemoteRef: ref]} do: [:each | | aValue bValue |
		aValue := each value: a.
		bValue := each value: b.
		(aValue and: [bValue not]) ifTrue: [^ true].
		(aValue not and: [bValue]) ifTrue: [^ false]].
	^ a <= b