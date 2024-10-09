accessing
activeRef
	^ (self activeRefTreeMember ifNil: [^ nil]) isRef
		ifTrue: [self activeRefTreeMember ref]
		ifFalse: [nil]