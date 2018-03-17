I am a node in a hierarchical (i. e., tree) representation of a diff.

Instance Variables
	children:		<Collection of more SquotDiffNodes>
	content:		<Object> anything that identifies the aspect of the diff that is represented by me
	title:		<String or Text> short description (one line) of the object I represent
			
The #content can be a complete TSquotDiff object, but it could also be some auxiliary object to denote only a part of such a diff object.