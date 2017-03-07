serializing
storeWith: aStore
	"double dispatch"
	^ aStore storeFile: self