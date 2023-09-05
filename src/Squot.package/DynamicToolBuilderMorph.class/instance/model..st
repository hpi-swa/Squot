accessing
model: anObject
	model ifNotNil: [model removeDependent: self].
	model := anObject.
	model ifNotNil: [model addDependent: self].
	self rebuild.