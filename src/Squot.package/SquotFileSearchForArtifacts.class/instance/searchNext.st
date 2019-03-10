as yet unclassified
searchNext
	| association fileOrDirectory locators |
	association := searchFrontier removeFirst.
	fileOrDirectory := association key.
	locators := association value.
	locators do: [:each | each detectArtifactsIn: fileOrDirectory search: self].