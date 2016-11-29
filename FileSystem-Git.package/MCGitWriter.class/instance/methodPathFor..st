accessing
methodPathFor: aMethodDefinition
	|path|
	path := self classPathFor: (aMethodDefinition classIsMeta 
											ifTrue: [ aMethodDefinition actualClass theNonMetaClass ] 
											ifFalse: [ aMethodDefinition actualClass ]).
	
	path := path / (aMethodDefinition classIsMeta 
											ifTrue: [ 'class-side' ] 
											ifFalse: [ 'instance-side' ]).
	path := path / aMethodDefinition category.
	^ path / aMethodDefinition selector, 'st'