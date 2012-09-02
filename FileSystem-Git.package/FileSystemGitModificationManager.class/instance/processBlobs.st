operations
processBlobs
	"only save new files here and put new git tree entries into their parent"
	
	| reference data blob entry |
	self createdPathsDo: [ :tree :path |
		self processBlobAt: path in: tree]