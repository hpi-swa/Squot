private
searchOnceFor: value ifNew: newBlock ifFound: foundBlock
	| name |
	walk checkPathsTo: value ifMultiple: [^ self].
	name := self rememberNameOf: value.
	self searchFor: value named: name
		ifNew: [newBlock value: name]
		ifFound: foundBlock.