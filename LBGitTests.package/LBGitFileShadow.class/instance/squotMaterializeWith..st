Squot-shadow
squotMaterializeWith: aMaterializer
	"Answer the object restored from me. Double dispatch path"
	| fileInfo |
	self halt: 'Please write me to a file'.
	fileInfo := LBGitFileInfo fromGitReference: self gitReference.
	fileInfo content: self content.
	^ fileInfo
	"^ aMaterializer materialize: self in: self fileInfo"