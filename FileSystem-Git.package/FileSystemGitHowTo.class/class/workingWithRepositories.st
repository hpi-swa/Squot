pages
workingWithRepositories
	"This method was automatically generated. Edit it using:"
	"FSGitHowTo edit: #introduction"
	^HelpTopic
		title: 'Working with repositories'
		contents: 
'** How to use FS-Git - Working with repositories **
=====================================================

There are two classes a user of FS-Git needs to know: FSGitRepository and FSGitFilesystem. FSGitFilesystem implements the public Filesystem protocol and is the central object for most of the work. FSGitRepository encapsulates the knowledge of communication with a Git repository and is the starting point for working with Git.

A speciality about FSGit is that it provides a filesystem on top of another filesystem. Therefore, to instantiate a repository we need a reference to another filesystem. For this introduction we will work on a disk filesystem:
	repoReference := FSFilesystem disk root resolve: ''/Developer/webApp''. 
	repo := FSGitRepository on: repoReference.

FSGitRepository defines four messages to browse the contents of a git repository: 
	
	repo head.

#head answers an FSGitFilesystem object representing the head commit of the current repository.
	
	repo branches.

#branches answers a dictionary of branch names (strings) associated with FSGitFilesystem objects. Each object represents the head commit of a branch.

	repo tags.
#tags answers a dictionary of tag names (strings) associated with FSGitFilesystem objects. Each object represents a commit referenced by a tag found in the repository.

	repo versions.
#versions answers a collection of FSGitFilesystem objects, one for every commit found in the repository (independent of the active branch). Depending on the size of the repository this statement may take several minutes to complete.!' readStream nextChunkText