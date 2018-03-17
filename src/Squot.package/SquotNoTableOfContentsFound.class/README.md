I am signalled when a FileSystemStore does not know how to find the paths of stored objects. Handlers can use other means to identify objects in the file system and let me know about them. I can then provide a fallback table of contents.

Instance Variables
	rootDirectory:		<FSReference> root directory of a version's file tree
	store:		<SquotFileSystemStore> store that operates on the rootDirectory
	tableOfContents:		<Dictionary> fallback table of contents to be provisioned by handlers