update migration
migrateOldMetadataFromFiles: aSquotFileSystemStore
	"Introduce list of references with object type and stored content type."
	| storeClass |
	(self includesKey: #id) ifFalse: [self at: #id put: UUID new].
	(SquotToggles useNewApi and: [(self includesKey: 'references') not]) ifFalse: [^ self].
	storeClass := aSquotFileSystemStore findStoreForOldArtifactWithoutReferences: self.
	storeClass migrateOldArtifactWithoutReferences: self.
	"self at: 'references' put: (Array with:
		(((self at: #objectClassName) endsWith: ' class')
			ifTrue: ['class' -> (OrderedDictionary newFrom:
						{'type' -> 'class'.
						'className' -> ((self at: #objectClassName) copyUpTo: Character space).
						'content-type' -> (self class environment classNamed: (self at: #serializer)) contentType})]))."