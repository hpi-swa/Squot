adding and removing
validatePath: path for: anArtifact
	"Check the path with the file system store."
	self flag: #duplication. "SquotFileTestVersion>>snapshot"
	^ SquotFileSystemStore validatePath: path for: anArtifact