utilities
assertTableOfContentsExists
	self assert: (fileStore directory / '.squot') isFile description: 'table of contents not found'.