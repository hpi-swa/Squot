navigating
files
	"Return all the files (as opposed to folders) contained in the receiver"
	
	^self children select: [:each | each isFile]