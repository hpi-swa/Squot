accessing
projectIndex
	| default |
	default := self projectList size > 1
		ifTrue: [2]
		ifFalse: [1].
	^ projectIndex ifNil: [default]