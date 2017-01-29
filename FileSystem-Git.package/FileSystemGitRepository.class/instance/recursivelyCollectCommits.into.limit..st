private to be removed
recursivelyCollectCommits: aCommit into: aCollection limit: anInteger
	anInteger notNil & anInteger = 0 ifTrue: [ ^ self ].
	
	self flag: 'TODO'.
	"aCommit isLoaded ifFalse: [ aCommit loadLazily ]."
	aCollection add: aCommit.
	aCommit parents do: [ :parent | 
		self 
			recursivelyCollectCommits: parent
			into: aCollection
			limit:
				(anInteger
					ifNil: [ nil ]
					ifNotNil: [ anInteger - 1 ]) ]