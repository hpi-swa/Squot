accessing metadata
serializer: aSerializerFactory
	"Set the serializer in the metadata and update the path of the artifact if necessary."
	| oldPath |
	oldPath := artifact path.
	artifact serializer: aSerializerFactory.
	self updatePath.