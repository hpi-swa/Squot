reflection
reflect: aCollectionElement removeFrom: aHashedCollection
	"Remove the reference from the object."
	^ aHashedCollection remove: aCollectionElement target ifAbsent: []