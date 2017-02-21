git protocol clients
pushReferences: updateAssociations of: aRepository deleting: deleteAssociations
	"git push {updateAssociations keys [String]}:{updateAssociations values [GitStorableObject]}"
	"git push :{deleteAssociations keys [String]} (need the values [git signatures] for the wire)"
	^ self subclassResponsibility