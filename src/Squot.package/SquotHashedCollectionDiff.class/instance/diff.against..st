initialize-release
diff: leftObjectShadow against: rightShadow
	super diff: leftObjectShadow against: rightShadow.
	leftObjectShadow diffItemsAgainstThoseOf: rightShadow in: self.