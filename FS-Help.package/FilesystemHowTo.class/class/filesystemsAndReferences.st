pages
filesystemsAndReferences
	"This method was automatically generated. Edit it using:"
	"FilesystemHowTo edit: #filesystemsAndReferences"
	^HelpTopic
		title: 'Filesystems and references'
		contents: 
'** How to use Filesystem - Filesystems and references **
=====================================================

The class "FSFilesystem" is the entrypoint for creating and addressing different filesystems. An instance of the filesystem of the current platform can be retrieved by evaluating the following in a workspace:
   disk := FSFilesystem onDisk.

An FSFilesystem object answers FSReference objects that describe the relationship between a resource (e.g. a file or directory) inside a filesystem and the filesystem itself. We now ask the filesystem for a reference to the working directory and assign it to the variable "working". The working directory is the directory containing the running image.
   working := disk workingDirectory.

Sending the message #root to the filesystem object answers a reference to the root of the filesystem ("/" in Unix, "C:\" in Windows usually). But since we do not want to corrupt any data and permissions might be a problem we will use the working directory instead for further examples.!' readStream nextChunkText