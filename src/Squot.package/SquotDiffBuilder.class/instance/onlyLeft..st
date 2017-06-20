diffing high-level
onlyLeft: aMetaobject
	"Answer a diff that would remove aMetaobject from the target."
	^ aMetaobject squotDiffAgainst: (self absent: aMetaobject) with: self