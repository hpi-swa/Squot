tests
testWorkingCopyNotAffectedBySourceStoreChanges
	| artifactSnapshot directory fileStore |
	SquotToggles useNewApi ifTrue:
		[| artifact project objectSnapshot |
		artifact := SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewId
			at: 'path' put: 'object';
			at: 'references' put: (Dictionary newFrom:
				{'object_1' -> (Dictionary newFrom:
					{'type' -> 'ValueHolder'.
					'content-type' -> 'application/octet-stream'.
					'codec-class' -> 'SmartRefStream'})});
			yourself).
		objectSnapshot := (SquotObjectCapturer new registry: SquotObjectRegistry new; captureGraph: ValueHolder new; objectGraph) asShadowGraph.
		artifactSnapshot := SquotArtifactSnapshot artifact: artifact objectSnapshot: objectSnapshot.
		project := SquotProject id: UUID new metadata: Dictionary new artifacts: (Dictionary newFrom: {artifact id -> artifact}).
		directory := FileSystem memory root.
		fileStore := SquotFileSystemStore inDirectory: directory.
		(fileStore storeForArtifact: artifact) putArtifact: artifactSnapshot.
		fileStore writeProject: project.
		self deny: (((fileStore storeForArtifact: artifact) readArtifact: artifact) patchRelativeToBase: artifactSnapshot) hasChanges.
		"When the artifact from the directory is added to the working copy as unloaded artifact and afterwards the files are deleted..."
		artifact := fileStore readProject artifacts at: artifact id.
		workingCopy useStoreImplementation: SquotSnapshotStore forArtifact: artifact.
		(workingCopy storeForArtifact: artifact) putArtifact: ((fileStore storeForArtifact: artifact) readArtifact: artifact). "Basically the test asserts that this snapshot put into the working copy is not lazily initialized from the file store."
		directory children do: [:each | each deleteAll].
		"...then the artifact in the working copy is still intact. Basically this test asserts that the artifactSnapshot stored in the working copy is not read from the files on demand."
		self deny: (((workingCopy storeForArtifact: artifact) readArtifact: artifact) objectSnapshot squotMergeWith: artifactSnapshot objectSnapshot basedOn: artifactSnapshot objectSnapshot) hasChanges.
		^ self].
	
	store add: ValueHolder new at: 'object'.
	artifactSnapshot := (store artifactAt: 'object') capture.
	store removeAt: 'object'.
	directory := FileSystem memory root.
	fileStore := SquotFileSystemStore inDirectory: directory.
	fileStore add: artifactSnapshot.
	self deny: ((fileStore artifactAt: 'object') content squotDiffAgainst: artifactSnapshot content) hasChanges. "But the serializer was added to the metadata."
	"when"
	workingCopy addUnloaded: (fileStore artifactAt: 'object').
	directory children do: [:each | each deleteAll].
	"then"
	self deny: ((workingCopy artifactAt: 'object') content squotDiffAgainst: artifactSnapshot content) hasChanges.