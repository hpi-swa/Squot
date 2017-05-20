as yet unclassified
<= other
	| maxIndex otherPath |
	otherPath := other path.
	maxIndex := otherPath size.
	self path withIndexDo: [:mine :index | | others |
		index > maxIndex ifTrue: [^ true].
		others := otherPath at: index.
		mine < others ifTrue: [^ true].
		mine > others ifTrue: [^ false]].
	^ true