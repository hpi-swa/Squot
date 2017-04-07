loading
materializeWith: aMaterializer replacing: anObject
	"Trigger a content-appropriate materialization procedure in aMaterializer"
	^ content squotMaterializeWith: aMaterializer from: self replacing: anObject