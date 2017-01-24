private
initializeObjectAt: path from: aFSReference using: aDeserializer
	"The object at aFSReference is not present in me yet. Unpack it and keep it."
	| objectFromSnapshot |
	objectFromSnapshot := aDeserializer readFrom: aFSReference.
	objectFromSnapshot ifNil: [^ self].
	self add: objectFromSnapshot at: path using: (self serializerOfObjectAt: aFSReference).