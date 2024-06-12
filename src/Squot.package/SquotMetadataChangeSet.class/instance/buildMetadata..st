as yet unclassified
buildMetadata: aCollection
	| metadata |
	metadata := self newMetadata copy.
	metadata setCurrentVersion.
	aCollection do: [:each |
		(self changeSetForProperty: each key) ifNotNil: [:changeSet |
			metadata perform: each key asSimpleSetter with: (each value value: changeSet)]].
	^ metadata