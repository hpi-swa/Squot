computing
limitHashBucket: aLinkedList withSize: aNumber
	| limit excessCount skipCountEach skipOneMoreCount currentLink currentlySkipping |
	limit := self class hashBucketLimit.
	excessCount := aNumber - limit.
	skipCountEach := excessCount // limit.
	skipOneMoreCount := excessCount \\ limit.
	currentLink := nil.
	currentlySkipping := 0.
	aLinkedList linksDo: [:link |
		currentlySkipping > 0
			ifTrue: [currentlySkipping := currentlySkipping - 1]
			ifFalse: [
				currentLink ifNotNil: [currentLink nextLink: link].
				currentLink := link.
				currentlySkipping := skipCountEach + (skipOneMoreCount > 0 ifTrue: [1] ifFalse: [0]).
				skipOneMoreCount := skipOneMoreCount - 1]].
	currentLink nextLink: nil.
	self entries: self entries - (aNumber - limit).