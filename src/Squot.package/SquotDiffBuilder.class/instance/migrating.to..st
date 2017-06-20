diffing low-level
migrating: leftMetaobject to: rightMetaobject
	"Answer a diff that can update leftMetaobject to rightMetaobject, which captures an object of a different type than leftMetaobject."
	"Might do more magic here to up- or downconvert instances in the same class hierarchy
	or dispatch an actual migration among independent types."
	^ self replacing: leftMetaobject with: rightMetaobject