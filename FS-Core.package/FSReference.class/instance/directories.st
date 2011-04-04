navigating
directories
	"Return all the directories (by opposition to files) contained in the receiver"
	^ self children reject: [:each | each isFile]