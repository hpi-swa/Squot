comparing
squotDiffAgainst: otherMetaobject
	"Answer an object that describes the differences between me and otherMetaobject."
	otherMetaobject ifNil: [^ self asSquotDiffOnlyLeft].
	^ SquotMetaobjectDiffBuilder new
		left: self right: otherMetaobject;
		diff