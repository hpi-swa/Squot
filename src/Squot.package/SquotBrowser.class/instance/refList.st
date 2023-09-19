ui
refList
	^ (self activeWorkingCopy ifNotNil: #allReferences ifNil: [^ {}])
			sorted: [:a :b | self doesRef: a comeBeforeRef: b]