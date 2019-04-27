diffing
reverseDiffAgainstLiveFiles: otherFilesArtifact
	"There is only one live file system"
	self = otherFilesArtifact ifTrue: [^ LBGitFileListDiff empty].
	^ self shouldNotImplement 