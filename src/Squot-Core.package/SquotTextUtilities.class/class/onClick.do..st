formatting
onClick: aTextOrString do: aBlock
	^ self addAttribute: (SquotPluggableTextAction evalBlock: aBlock) to: aTextOrString