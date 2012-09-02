public-testing
isInitialized
	^ (self gitDirectories allSatisfy: [ :each | (self baseDir resolve: each) exists ]) and: [ self headFile exists ]