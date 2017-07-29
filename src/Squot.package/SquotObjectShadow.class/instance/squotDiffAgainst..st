comparing
squotDiffAgainst: otherMetaobject
	"Answer an object that describes the differences between me and otherMetaobject."
	otherMetaobject ifNil: [self isThisEverCalled. ^ self asSquotDiffOnlyLeft].
	^ SquotDiffBuilder new
		left: self right: otherMetaobject