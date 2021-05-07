tests
testYourselfAnswersDecorator
	| decorated1 |
	decorated1 := SquotNameDecorator on: 1 withName: 'foo'.
	self assert: decorated1 == decorated1 yourself.