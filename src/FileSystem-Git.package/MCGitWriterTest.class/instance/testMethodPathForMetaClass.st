tests
testMethodPathForMetaClass
	"Most basic test, just making sure that it does not raise errors"
	| writer |
	writer := MCGitWriter new.
	writer stream: (FileLocator imageDirectory).
	self shouldnt: [ writer methodPathFor: (Integer class>>#new) methodReference ] raise: Error.  