private
searchFor: value named: name ifNew: newBlock ifFound: foundBlock
	| existing |
	existing := value sameIn: left asIn: right ifAbsent: [].
	existing
		ifNil: [newBlock value]
		ifNotNil: [foundBlock value: existing].