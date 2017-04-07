converting
squotContentFrom: anObject andItsCopy: copyOfAnObject
	"If the object was copied when the root object was copied (or it does not have identity),
	then convert it, otherwise omit it."
	copyOfAnObject ifNil: [^ nil].
	^ convertedObjects at: anObject
		ifAbsentPut: [anObject asSquotContentWith: self andCopy: copyOfAnObject]