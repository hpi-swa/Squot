Squot historian
newVersion: aSquotSnapshot message: commitMessage
	"Answer a new version based on my current version."
	| fs commit |
	fs := self newWorkingDirectory.
	(SquotFileSystemStore inDirectory: fs root)
		restoreToSnapshot: aSquotSnapshot.
	commit := fs commit: commitMessage.
	self flag: 'TODO: the above only works with refs/heads/... and not with multiple identical refs'.
	^ self version "the reference was already updated above"