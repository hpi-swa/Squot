accessing metadata
serializer: aSerializerFactory
	"Set the serializer in the metadata and update the path of the artifact if necessary."
	| oldPath newPath |
	oldPath := storeArtifact path.
	storeArtifact serializer: aSerializerFactory.
	newPath := workingCopy validatePath: oldPath for: storeArtifact.
	newPath ~= oldPath ifTrue:
		[workingCopy moveObjectAt: oldPath to: newPath.
		storeArtifact := workingCopy store artifactAt: newPath].