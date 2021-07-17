materializing
asMaterializedReference
	"Since a rematerialized reference will need to refer to the rematerialized object instead of the snapshot object, make an empty copy."
	^ self copyWithTarget: nil