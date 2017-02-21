as yet unclassified
push
	"push the contents using OS Process"
	
	^ self gitCommand: '" push "', self remote, '" master'.