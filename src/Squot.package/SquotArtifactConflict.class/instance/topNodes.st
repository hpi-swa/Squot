converting
topNodes
	^ {SquotDiffNode title: 'left side: ', left squotChangeAsStringOrText content: left children: left topNodes.
		SquotDiffNode title: 'right side: ', right squotChangeAsStringOrText content: right children: right topNodes}