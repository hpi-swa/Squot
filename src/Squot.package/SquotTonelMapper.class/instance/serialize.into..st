changes-operations
serialize: aSnapshot into: aFileSystem
	(self writerOn: aFileSystem) writeSnapshot: aSnapshot.