initialize-release
diff: leftObjectShadow against: rightShadow with: aDiffBuilder
	super diff: leftObjectShadow against: rightShadow with: aDiffBuilder.
	"leftObjectShadow diffItemsAgainstThoseOf: rightShadow in: self with: aDiffBuilder."