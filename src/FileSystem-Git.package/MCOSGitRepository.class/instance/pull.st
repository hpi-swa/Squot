as yet unclassified
pull
	"pull the contents using OS Process"
	
	^ self gitCommand: ' pull "', self remote, '" master'.