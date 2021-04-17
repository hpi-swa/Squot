reflection
reflectElement: aCollectionElement of: aHashedCollection
	"Answer the object from the collection with the same id as the element."
	| object useIdentity |
	useIdentity := self classUsesIdentityHash.
	object := useIdentity
		ifTrue: [(aHashedCollection includes: aCollectionElement target)
					ifTrue: [aCollectionElement target]
					ifFalse: []]
		ifFalse: [aHashedCollection
					detect: [:each | each = aCollectionElement target]
					ifNone: []].
	^ object
		ifNil: [aCollectionElement target
				ifNil: [nil]
				ifNotNil: [(NotFound object: aCollectionElement target) signal]]