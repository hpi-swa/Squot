serializing
storeWith: aStore
	"double dispatch"
	^ aStore storeUnrecordedFiles: self