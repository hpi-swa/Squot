accessing
methodPathFor: aMethodDefinition
	|path|
	path := self classPathFor: (aMethodDefinition classIsMeta 
											ifTrue: [ aMethodDefinition actualClass theNonMetaClass ] 
											ifFalse: [ aMethodDefinition actualClass ]).
	
	aMethodDefinition actualClass.
	path := path / (aMethodDefinition classIsMeta 
											ifTrue: [ 'class-side' ] 
											ifFalse: [ 'instance-side' ]).
	path := path / aMethodDefinition category.
	^ path