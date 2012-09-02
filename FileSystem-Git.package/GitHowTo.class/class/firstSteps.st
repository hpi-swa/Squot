pages
firstSteps
	"This method was automatically generated. Edit it using:"
	"FSGitHowTo edit: #firstSteps"
	^HelpTopic
		title: 'First Steps with the Git filesystem'
		contents: 
'** How to use FS-Git - First Steps with the Git filesystem **
=====================================================

The idea behind using FSGitFilesystem objects is to modify the working copy of a Git repository and then commit those changes. Here is a simple example of how to modify the working copy. In a first step we assign an instance of FSGitFilesystem to the variable "workingCopy". The FSGitFilesystem object contains the working copy of the head commit of the created repository (the repository is empty so the working copy is too):
   workingCopy := repo head.

We then assign a reference (instance of FSReference) to the variable "newFile". The reference points to a file that does not yet exists. We create it by writing some content to it:
	newFile := workingCopy root / ''newfile.txt''.
	newFile writeStreamDo: [ :stream |
		stream nextPutAll: ''some content'' ].
	
Note that ''workingCopy root'' answers the root of the Git filesystem and not the root of the disk filesystem. If you made a mistake and simply want to have a clean workingCopy again you can send #reset to the workingCopy:
   workingCopy reset.

Assuming that the changes are fine, the file is committed to the repository thus saving the state of the working copy. The message #commit expects a message string describing the changes made:
	workingCopy commit: ''created a new file''.
	
Committing the changes will create and update objects and references in your repository as needed. After the commit has succeeded the FSGitFilesystem object (the one referenced by the variable "workingCopy") will point to that commit with all the recent changes reflected in the working copy.

The contents of the file we committed can be retrieved using the Filesystem protocol:
	fileContents := newFile readStreamDo: [ :stream |
		stream contents asString ].!' readStream nextChunkText