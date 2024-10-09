formatting
onClick: aTextOrString do: aBlock
	^ self addAttribute: (GSPluggableTextAction evalBlock: aBlock) to: aTextOrString