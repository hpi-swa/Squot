accessing
filesystem
	^ filesystem ifNil: [filesystem := self createFilesystem]