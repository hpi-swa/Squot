accessing
branchIndex
	| default |
	default := self branchList size > 1
		ifTrue: [2]
		ifFalse: [1].
	^ branchIndex ifNil: [default]