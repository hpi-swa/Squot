tests
testFiles
	"ImageStore cannot store files"
	| filesArtifact snapshot |
	filesArtifact := SquotUnrecordedFilesArtifact new.
	snapshot := SquotSnapshot builder
		add: filesArtifact;
		buildSnapshot.
	imageStore restoreToSnapshot: snapshot.
	self deny: (imageStore includesObjectAt: 'vm').