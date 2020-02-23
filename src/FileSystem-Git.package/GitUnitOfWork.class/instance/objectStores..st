accessing
objectStores: aCollection
	objectStores := aCollection.
	objectStores do: [:each | each repository: self].