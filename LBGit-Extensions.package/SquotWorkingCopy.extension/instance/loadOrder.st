*LBGit-Extensions
loadOrder
	
	"This method is for compatibility to newer Squot versions"
	^ store loadOrder 
		addIfNotPresent: LBGitFilesArtifact path;
		yourself