Squot-shadow
squotMaterializeWith: aMaterializer
	"Answer the object restored from me. Double dispatch path"
	self halt: 'Please write me to a file'.
	^ self fileInfo
	"^ aMaterializer materialize: self in: self fileInfo"