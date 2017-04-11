working copy registry
registered
	"registry := nil"
	^ (registry ifNil: [registry := OrderedCollection new]) copy