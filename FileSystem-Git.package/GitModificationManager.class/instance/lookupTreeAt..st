private
lookupTreeAt: aPath
	|tree|
	tree := self rootTree.
	"walk down the tree from the root directory by directory"
	aPath do: [ :segment |
		tree := tree
			entryAt: segment
			ifPresent: [ :entry | 
				"let's try to load the entry, might still be that it has been freshly added by a previous processCreation send"
				^ repository objectNamed: entry entryHexHash ifAbsent: [ nil]]
			ifAbsent: [ ^ nil ] ].