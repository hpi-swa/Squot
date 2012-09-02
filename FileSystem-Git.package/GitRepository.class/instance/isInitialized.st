public-testing
isInitialized
	| isInitialized foundDirectories |
	foundDirectories := self gitDirectories collect: [ :each | (self baseDir resolve: each) exists ].
	^ (foundDirectories size = (self gitDirectories size))
		and: [ self headFile exists ]