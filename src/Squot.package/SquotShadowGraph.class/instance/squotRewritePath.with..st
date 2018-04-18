serializing
squotRewritePath: pathString with: aSerializer
	"delegate double dispatch with the serializer to the start shadow"
	^ self startShadow squotRewritePath: pathString with: aSerializer