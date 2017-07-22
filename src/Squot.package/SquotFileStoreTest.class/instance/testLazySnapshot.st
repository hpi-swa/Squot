tests
testLazySnapshot
	| textFile hollowArtifact hollowSnapshot lazySnapshot lazyArtifact spyingFs watchedTextFile watchedStore |
	"given a tracked text"
	textFile := fileStore directory / 'aText.txt'.
	textFile writeStreamDo: [:stream | stream nextPutAll: 'Hello world'].
	hollowArtifact := SquotArtifact new path: (SquotPath fromReference: textFile); yourself.
	hollowArtifact storeInfo at: #serializer put: SquotTextFileCodec name.
	hollowSnapshot := SquotSnapshot builder add: hollowArtifact; buildSnapshot.
	fileStore generateTableOfContentsFor: hollowSnapshot in: fileStore directory.
	fileStore storeSquotMetadataFor: hollowArtifact.
	"when"
	spyingFs := FileSystem store: (SquotFSStoreSpy on: textFile fileSystem store).
	watchedStore := SquotFileSystemStore inDirectory: (spyingFs referenceTo: fileStore directory).
	lazySnapshot := watchedStore captureLazySnapshot.
	"then do not read the text file"
	lazyArtifact := lazySnapshot artifactAt: 'aText.txt'.
	self assert: 'aText.txt' equals: lazyArtifact path. "access the path"
	watchedTextFile := spyingFs referenceTo: textFile path.
	self deny: (spyingFs store wasOpened: watchedTextFile).
	"until the content of the artifact is accessed"
	self assert: 'Hello world' equals: (SquotImageStore new restoreObjectFrom: lazyArtifact).
	self assert: (spyingFs store wasOpened: watchedTextFile).