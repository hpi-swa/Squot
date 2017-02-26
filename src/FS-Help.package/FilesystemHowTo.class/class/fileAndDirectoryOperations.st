pages
fileAndDirectoryOperations
	"This method was automatically generated. Edit it using:"
	"FilesystemHowTo edit: #fileAndDirectoryOperations"
	^HelpTopic
		title: 'File and directory operations'
		contents: 
'** How to use Filesystem - File and directory operations **
=====================================================

Files and directories can be copied between references in the same filesystem (first line of next example) or even across different types of filesystems (second line of next example) such as between a disk filesystem and a memory filesystem:
	(working / ''letter.txt'') copyTo: (working / ''letter_backup.txt'').

	memory := FSFilesystem inMemory.
	(working / ''letter.txt'') copyTo: (memory / ''letter_backup.txt'').
	memory children first basename.				" --> ''letter.txt'' "	
					
Supposing one wanted to backup an entire directory there needs to be a suitable target directory. Since there are no directories in the memory filesystem just created we will now create one to hold the mentioned backup:
	backup := memory / ''cache-backup''.
	backup createDirectory.	
		
Finally, we copy the directory to be backed up to the destination directory:
   cache copyAllTo: backup.

The target directory would also have been created automatically by the message #copyAllTo: had it not existed already. From time to time the backup needs to be cleaned up. In this case, we no longer need the backup of the file "letter.txt":
	(memory / ''letter_backup.txt'') delete.

A complete directory tree can be deleted by sending deleteAll:
	backup deleteAll.!' readStream nextChunkText