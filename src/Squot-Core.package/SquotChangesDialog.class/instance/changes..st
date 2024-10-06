accessing
changes: aCollection
	changes ifNotNil: [changes do: [:each | each removeDependent: self]].
	changes := aCollection.
	changes ifNotNil: [changes do: [:each | each addDependent: self]].
