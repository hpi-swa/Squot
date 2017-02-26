tests
testResolvePath
	"self debug: #testResolvePath"
	
	| path |
	path := FSPath / 'grandfather' / 'father' / 'child'.
	self assert: (path resolvePath: FSPath / 'grandfather') = (FSPath / 'grandfather').
	self assert: (path resolvePath: FSPath / 'child') = (FSPath / 'child').
	self assert: (path resolvePath: FSPath * 'grandfather') = (FSPath / 'grandfather' / 'father' / 'child' / 'grandfather').
	self assert: (path resolvePath: FSPath * 'child') = (FSPath / 'grandfather' / 'father' / 'child' / 'child').
	self assert: (path resolvePath: FSPath * 'grandfather') = (FSPath / 'grandfather' / 'father' / 'child' / 'grandfather').
	self assert: (path resolvePath: FSPath * 'child') = (FSPath / 'grandfather' / 'father' / 'child' / 'child').
	self assert:  (path resolvePath: (FSPath parent) / '..') =  (FSPath / 'grandfather')

