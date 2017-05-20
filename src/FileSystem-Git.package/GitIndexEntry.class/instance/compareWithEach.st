as yet unclassified
compareWithEach
	"Answer a block to be used for a binary search among index entries"
	^ [:each | self <= each
				ifTrue: [each path = self path
						ifTrue: [0]
						ifFalse: [-1]]
				ifFalse: [1]]