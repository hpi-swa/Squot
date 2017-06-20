diffing high-level
onlyRight: aMetaobject
	"Answer a diff that would create aMetaobject at the target."
	^ (self absent: aMetaobject) squotDiffAgainst: aMetaobject with: self