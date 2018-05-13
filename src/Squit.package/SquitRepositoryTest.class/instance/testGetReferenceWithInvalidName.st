tests
testGetReferenceWithInvalidName
	
	| invalidNames |
	invalidNames := {'@' . 'a/.a' . 'a/a.lock' . 'a..' . '..a' . '../a' . 'a:' . 'a^' . 'a~' . 'a[' . 'a?' . 'a*' . '/a' . 'a/' . 'a//b' . '@{a' . '\' . 'a b' . 'a	b'}.
	
	invalidNames do: [:name | 
		self 
			should: [squitRepository historianNamed: name] 
			raise: SquotIllegalReferenceName]
		
	
	
	