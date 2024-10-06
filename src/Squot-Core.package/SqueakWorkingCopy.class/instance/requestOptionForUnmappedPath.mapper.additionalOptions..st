paths
requestOptionForUnmappedPath: aPath mapper: mapper additionalOptions: aCollection
	| options values |
	options := {'Cancel the operation'. 'Choose a different path'} asOrderedCollection.
	values := {#cancel. #different} asOrderedCollection.
	mapper canBeRemovedAtAll ifTrue: [
		options addLast: 'Overwrite this path'.
		values addLast: #overwrite].
	aCollection do: [:each |
		options addLast: each key.
		values addLast: each value].
	^ (UIManager default
		chooseOptionFrom: options
		values: values
		title: ('The path {1} is already taken.'
				format: {(SquotPathUtilities asString: aPath) printString}))
		ifNil: [#cancel]