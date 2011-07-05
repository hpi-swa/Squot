public
at: index read: buffer startingAt: start count: count
	^ Primitives 
		setPosition: id to: index - 1;
		read: id into: buffer startingAt: start count: count
