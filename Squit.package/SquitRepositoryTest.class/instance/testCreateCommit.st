tests
testCreateCommit
	| master oldMasterVersion editableSnapshot newVersion gitMaster commit |
	master := squitRepository historianNamed: 'master'.
	oldMasterVersion := master version.
	"create a new snapshot (by using whatever means available)"
	self flag: #hack. "this looks horrible, API-wise"
	editableSnapshot := oldMasterVersion snapshot.
	(editableSnapshot / 'README.md') 
		writeStreamDo: [:stream | stream nextPutAll: 'hollaboo'; truncate].
	self assert: ((editableSnapshot / 'README.md') readStreamDo: [:s | s contents asString]) = 'hollaboo'.
	"create a new version from this snapshot"
	newVersion := master newVersion: editableSnapshot message: 'This is a test commit'.
	"assertions about the Squit objects"
	self assert: newVersion snapshot = (gitRepository branchNamed: 'master').
	self assert: newVersion parents asArray = {oldMasterVersion}.
	self assert: 'This is a test commit' equals: newVersion message.
	"assertions about the git contents"
	gitMaster := (gitRepository branchNamed: 'master').
	commit := gitMaster revision.
	self assert: 'This is a test commit' equals: commit message.
	self assert: 'hollaboo' equals: ((gitMaster / 'README.md') readStreamDo: [:s | s contents asString]).
	self assert: commit parents asArray = {oldMaster}.