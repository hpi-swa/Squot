as yet unclassified
gitCommand: aCommandString
	"push the contents using OS Process"
	
	| localPath command |
	
	localPath := 	self repository repository baseDir pathString.
		
	command := OSProcess thisOSProcess 
		waitForCommand: 'git --git-dir="', localPath, aCommandString.
		
	self assert: command succeeded 