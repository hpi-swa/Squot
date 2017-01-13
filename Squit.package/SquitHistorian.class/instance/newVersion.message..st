Squot historian
newVersion: aGitFilesystem message: commitMessage
	"Answer a new version based on my current version. The new version will have aGitFileSystem as its snapshot."
	| commit |
	self flag: #metamodel.
	commit := aGitFilesystem commit: commitMessage.
	^ self version "the reference was already updated above"