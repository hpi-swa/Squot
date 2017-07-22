rematerializing
squotMaterializeWith: aMaterializer
	"Answer the object restored from me. Double dispatch path"
	| object |
	object := self createMaterializedInstance.
	^ aMaterializer materialize: self in: object