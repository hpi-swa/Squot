tests
testCreateCommit
	| master oldMasterVersion oldMasterSnapshot snapshotBuilder newVersion newSnapshot gitMaster commit |
	master := squitRepository historianNamed: 'master'.
	oldMasterVersion := master version.
	"create a new snapshot (by using whatever means available)"
	oldMasterSnapshot := oldMasterVersion snapshot.
	snapshotBuilder := oldMasterSnapshot createNewBuilder.
	self assert: (oldMasterSnapshot artifactAt: 'README.md')
		equals: (snapshotBuilder artifactAt: 'README.md') description: 'shared blob'.
	(snapshotBuilder artifactAt: 'README.md') fileReference
		writeStreamDo: [:stream | stream nextPutAll: 'hollaboo'; truncate].
	"create a new version from this snapshot"
	newVersion := master newVersion: snapshotBuilder buildSnapshot
		message: 'This is a test commit'.
	"assertions about the Squit objects"
	newSnapshot := newVersion snapshot.
	self assert: 'hollaboo' equals: (newSnapshot artifactAt: 'README.md') content.
	self assert: newVersion parents asArray = {oldMasterVersion}.
	self assert: 'This is a test commit' equals: newVersion message.
	"assertions about the git contents"
	gitMaster := (gitRepository branchNamed: 'master').
	commit := gitMaster revision.
	self assert: 'This is a test commit' equals: commit message.
	self assert: 'hollaboo' equals: ((gitMaster / 'README.md') readStreamDo: [:s | s contents asString]).
	self assert: commit parents asArray = {oldMaster}.