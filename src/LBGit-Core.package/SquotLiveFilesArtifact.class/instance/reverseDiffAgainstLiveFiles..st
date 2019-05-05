diffing
reverseDiffAgainstLiveFiles: otherFilesArtifact
	"There is only one live file system"
	"This could however occur when somebody tries to snapshot the image store and diff between the snapshot and the actuel live system
	Live files currently does not support snapshotting them"
	^ SquotFileListDiff empty