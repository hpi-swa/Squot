accessing
path
	"Answer that path to which this diff can be applied."
	| object |
	object := left ifNil: [right].
	^ SquotToggles useNewApi ifTrue: [object artifact storeInfo at: 'path'] ifFalse: [object path]