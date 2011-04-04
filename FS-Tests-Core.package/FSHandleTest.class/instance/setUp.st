running
setUp
	filesystem := self createFilesystem.
	reference := filesystem referenceTo: 'plonk'.
	handle := reference openWritable: true