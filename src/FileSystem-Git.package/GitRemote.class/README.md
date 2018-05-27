I am a handle for a remote Git repository, consisting of a name and a URL.

Instance Variables
	name:		<String> name of the remote in the local repository
	url:			<Url> locator of the remote repository
	fetchSpecs:	<Collection> of GitFetchSpec for configuring the fetch behavior
	repository:	<GitRepository> for lazy loading of properties