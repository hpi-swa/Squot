initialize-release
cleanUp: aggressive
	"Remove credentials"
	aggressive ifTrue: [self allSubInstancesDo: [:each | each removeAllCredentials]].