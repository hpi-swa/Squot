accessing
operation
	self isResolved ifFalse: [^ nil].
	self left = self resolution ifTrue: [^ nil].
	^ self left
		ifNil: [MCAddition of: self resolution]
		ifNotNil: [self resolution
					ifNil: [MCRemoval of: self left]
					ifNotNil: [MCModification of: self left to: self resolution]]