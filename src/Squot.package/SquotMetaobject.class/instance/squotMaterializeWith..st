rematerializing
squotMaterializeWith: aMaterializer
	"Answer the object restored from me. Double dispatch path"
	| object |
	object := self createMaterializedInstance.
	^ aMaterializer rematerialize: object from: self