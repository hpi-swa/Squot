instance creation
default
	"You can edit this method to change the authors to choose from."
	^ CoAuthorList new
		addName: 'Max Mustermann' email: 'max.mustermann@foo.bar';
		yourself