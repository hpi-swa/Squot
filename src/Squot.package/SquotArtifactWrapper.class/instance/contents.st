as yet unclassified
contents
	^ (self item first diffAgainst: self item second) topNodes
		collect: [:each | SquotDiffNodeWrapper with: each model: self model].
	"^ self item content definitions collect: [:each |
		SquitMCDefinitionWrapper with: each model: self model original: (self model model originalOf: self item)]"