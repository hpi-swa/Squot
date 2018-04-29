testing
testAnswersSuppressBlockValue
	self assert: (changeLogSuppressor suppressChangeNotificationsDuring: [42]) = 42.