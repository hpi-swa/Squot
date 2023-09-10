as yet unclassified
actOnClickFor: model in: aParagraph at: clickPoint editor: editor
	^ self eval: {model. aParagraph. clickPoint. editor}