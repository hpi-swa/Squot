running
setUp
	filesystem := self createFilesystem.
	reference := filesystem * 'plonk'.
	handle := reference openWritable: true