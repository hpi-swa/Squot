tests
testNow
	| stamp now |
	stamp := self defaultStamp.
	now := TimeStamp now.
	
	self assert: stamp timeStamp <= now.	
	self assert: stamp name = GitStamp defaultName.
	self assert: stamp email = GitStamp defaultEmail.