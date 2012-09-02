pages
advancedManipulations
	"This method was automatically generated. Edit it using:"
	"GitHowTo edit: #advancedManipulations"
	^HelpTopic
		title: 'Advanced manipulations'
		contents: 
'** How to use FileSystem-Git - Advanced manipulations **
=====================================================

To provide a better picture of what Git is capable of we will create a second commit so that the repository holds two versions of the working copy:
	(workingCopy / ''dir1'') ensureDirectory.
	anotherFile := workingCopy root resolve: ''dir1/anotherFile.txt''.
	anotherFile writeStreamDo: [ :stream |
		stream nextPutAll: ''beginning of another file.'' ].
	workingCopy commit: ''added a second file''.
	
Evaluating the following will now answer a collection of four references: "/", "/newFile.txt", "/dir1" and "/dir1/anotherFile.txt":
   workingCopy root allChildren.

Once you are satisfied with your changes you might want to commit and at the same time mark that commit specially. FS-Git offers convenience methods for this scenario:
	workingCopy
		commit: ''a commit message''
		andTag: ''version 1.0''.

#commit:andTag: creates a commit and a tag referencing that commit (at the moment only light tags are supported). From now on it will be easy to identify the commit that was used for the release of version 1.0. You might also choose to tag another commit you made earlier:
	workingCopy
		tagRevision: workingCopy parents first
		with: ''introduces cool new feature''.
		
Version 1.0 will probably not be the last version. It might therefore be convenient to do new work on a separate branch to separate versions clearly:
	workingCopy
		branch: ''my fork''
		message: ''a commit message''.
		
#branch:message: creates a commit with the current changes and a new branch referencing that commit. If the branch already exists it will be updated to the current commit. Of course you can also commit to a new branch and tag that commit with only one message if you like:
	workingCopy
		branch: ''my fork''
		message: ''alpha release''
		andTag: ''1.1 alpha''.
		
There are also messages to  access commit information. E.g. sending #name to an FSGitFilesystem object will answer the sha1 signature of that commit:
	parentSignature := workingCopy parents first name.
	
To retrieve the commit message of a particular version send the FSGitFilesystem object the message #message:
	commitMessage := workingCopy parents first message.!' readStream nextChunkText