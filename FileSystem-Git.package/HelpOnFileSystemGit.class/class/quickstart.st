pages
quickstart
	"This method was automatically generated. Edit it using:"
	"HelpOnFSGit edit: #quickstart"
	^HelpTopic
		title: 'Quick-start'
		contents: 
'** Quickstart **
=====================================================

Get a filesystem on the head of a Git repository (new or existing) by evaluating the following expression in a workspace:
	workingCopy := FileSystem onGit: (<anFSReference>).
	
Examples of expressions for <anFSReference>:
	->  FSFilesystem inMemory / ''repository''
	->  FSFilesystem disk root resolve: ''/Users/mikado/Desktop/repository''
	
Create a file in the working copy:
	(workingCopy / ''<file name>'') writeStreamDo: [ :stream | 
		stream nextPutAll: ''<file content>'' ].
	
Finally, commit your changes:
	workingCopy commit: ''<commit message>''.!' readStream nextChunkText