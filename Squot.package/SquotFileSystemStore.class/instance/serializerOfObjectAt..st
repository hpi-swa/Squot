private
serializerOfObjectAt: aFSReference
	"Answer the serializer used to serialize an object to aFSReference."
	| serializerName |
	serializerName := (self metadataForObjectAt: aFSReference) serializerName.
	^ self findSerializerByName: serializerName