private
take: anObject asMaterializedFrom: aShadow
	"Recognize anObject as being the materialized form of aShadow."
	treatedObjects at: aShadow undecorated put: anObject.