private
findSerializerByName: serializerName
	"Answer the most likely Serializer factory that was used under this name."
	"Might want to have a registry dictionary in the future."
	| className |
	className := serializerName substrings first asSymbol.
	(Environment current valueOf: className)
		ifNotNilDo: [:class | self flag: 'The version part is currently ignored.'.
			^ class]
		ifNil: [self error: 'Unknown serializer: ', serializerName].