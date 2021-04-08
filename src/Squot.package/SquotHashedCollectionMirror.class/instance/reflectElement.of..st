reflection
reflectElement: aCollectionElement of: aHashedCollection
	"Answer the object from the collection with the same id as the element."
	| object |
	object := aHashedCollection detect: [:each | each = aCollectionElement target] ifNone: [].
	^ object
		ifNil: [aCollectionElement target
				ifNil: [nil]
				ifNotNil: [(NotFound object: aCollectionElement target) signal]]