I test that the Monticello converter works with a specific repository type. Subclass me for your own type of repository to check whether the converter supports it as well.

This class uses the SquotInMemoryRepository to perform its tests. Subclasses should override #newRepository.

Instance Variables
	converter:		<SquotMonticelloConverter>
	repository:		<TSquotLocalRepository>
