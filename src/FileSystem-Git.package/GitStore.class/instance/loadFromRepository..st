internal
loadFromRepository: aPath
	"try to load the given path from the repositry into our cache"
	| entry |
	self logMessage: 'loadFromRepository: ', aPath printString.
	entry := self loadGitTreeEntryAt: aPath.
	"path doesn't exist in the repository either"
	entry ifNil: [
		self logMessage: 'No entry at ', aPath printString.
		^ self].
	entry isInDirectoryMode ifTrue: [self loadGitTreeAt: aPath].
	entry isInFileMode ifTrue: [ | blob |
		blob := entry object.
		self updateCacheAt: aPath with: blob].