diffing low-level
replacing: leftMetaobject with: rightMetaobject
	"Answer a diff that will replace the target object with the rightMetaobject"
	^ SquotObjectReplacement left: leftMetaobject right: rightMetaobject