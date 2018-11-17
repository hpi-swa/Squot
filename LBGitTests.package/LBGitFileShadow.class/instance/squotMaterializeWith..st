Squot-shadow
squotMaterializeWith: aMaterializer
	"Answer the object restored from me. Double dispatch path"
	self flag: #TODO. "Is this where I should write my file?"
	^ self fileInfo
	"^ aMaterializer materialize: self in: self fileInfo"