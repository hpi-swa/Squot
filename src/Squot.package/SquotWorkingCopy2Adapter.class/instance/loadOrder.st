accessing
loadOrder
	"...of paths"
	^ workingCopy project artifacts asArray collect: [:each | each path]