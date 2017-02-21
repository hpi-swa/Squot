tests
testDeletedDirectoryContentsDoesNotReappear
	| theFile theDirectory |
	(theDirectory := filesystem / 'foobar') ensureDirectory.
	(theFile := theDirectory / 'bla') ensureFile.
	self assert: theFile exists.
	"when"
	theDirectory delete.
	"then"
	self deny: theDirectory exists.
	self deny: theFile exists.
	"when"
	theDirectory ensureDirectory.
	"then"
	self assert: theDirectory exists.
	self deny: theFile exists description: 'file reapperared'.