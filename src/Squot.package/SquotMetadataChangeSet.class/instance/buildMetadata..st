metadata-creation
buildMetadata: aBlock
	| metadata |
	metadata := self oldMetadata copy.
	self propertyChangeSets do: [:each |
		metadata perform: each property asSimpleSetter with: (aBlock value: each)].
	metadata setCurrentVersion.
	^ metadata withoutUntrackedMappers