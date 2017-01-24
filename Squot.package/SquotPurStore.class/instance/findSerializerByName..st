private
findSerializerByName: serializerName
	"Answer the most likely Serializer factory that was used under this name."
	"Might want to have a registry dictionary in the future."
	| className |
	className := serializerName substrings first.
	(Environment current hasClassNamed: className)
		ifTrue: [self flag: 'The version part is currently ignored.'.
			^ Environment current valueOf: className]
		ifFalse: [self error: 'Unknown serializer: ', serializerName].