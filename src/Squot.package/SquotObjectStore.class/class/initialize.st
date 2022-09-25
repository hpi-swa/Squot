class initialization
initialize
	"self initialize"
	ObjectRegistry ifNil: [ObjectRegistry := SquotObjectRegistry new].