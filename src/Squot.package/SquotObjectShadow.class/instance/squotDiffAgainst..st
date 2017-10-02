comparing
squotDiffAgainst: otherMetaobject
	"Answer an object that describes the differences between me and otherMetaobject."
	^ SquotDiffBuilder new
		left: self right: otherMetaobject