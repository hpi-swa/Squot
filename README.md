# Squot
Squeak Object Tracker - Version control for objects such as code and files in Squeak, using [git](https://git-scm.com/).

## Installation instructions

You need [Metacello](//github.com/dalehenrich/metacello-work) first.
Then, use the following snippet to load the Git Browser and all its dependencies:

```smalltalk
Metacello new
  baseline: 'Squot';
  repository: 'github://hpi-swa/Squot:mapper/src';
  load.
```

## Usage instructions

After installing Squot, you will find a "Git Browser" in the Apps menu. With this tool you can create projects (in-image working copies) that can contain multiple objects, such as packages (code) and other files, called *assets*. Each object is stored at or under a path. When you checkout the Git repository in the file system, an object's path is its relative path in the working copy. From the Git Browser, you can create new commits, synchronize with remote repositories (fetch, pull, push), manage and merge branches, switch between them, and compare different versions. There is also another user interface called the Git Asset Browser. Using it, you can import and edit assets, like images, animations, sounds, texts or blobs.

### Getting started with an existing remote project

1. Open the Git Browser from the Apps menu in the docking bar.

2. To ensure you have an up-to-date version of Squot, click the "..." button on the bottom right and select "Self-update".

3. The pane at the top left pane is the list of projects which are currently managed through Squot. We will now clone an existing project by opening the context menu of the list and selecting "Clone project".

4. A wizard opens which will guide us through the steps to clone the project.

5. First, the wizard asks for an URL to clone from. We use the https URL of our repository for that. For GitHub projects you can find the https URL on the project main page after clicking on the button labeled "Clone or download" (You might have to select "Use HTTPS").

6. Second, we have to select a folder in which Squot can store the Git repository. Squot suggests a folder based on the URL.

7. We have now provided all necessary details and Squot will go ahead and clone the project for us.

8. Depending on the repository, Squot might ask for credentials. In that case, you have to enter your GitHub username and a GitHub personal access token with the `repo` scope. You can create one on the [settings page](https://github.com/settings/tokens).

9.  As soon as Squot finished cloning, we have the repository on the disk and registered in the system, but we do not yet have the objects loaded from the repository into Squeak. Squot now asks you to do just that.

10. If you tell Squot to load the current commit into the image, a window pops up with the changes to load. You can inspect the changes by selecting them in the left tree pane. If you are happy with them, you can click on the "Load changes" button on the bottom right.

11. After a short loading time, the objects are now loaded in the system. If the repository stored packages, you can now start browsing your code. If the repository stored assets, you can browse them in the [Git Asset Browser](#using-the-git-asset-browser).

### Committing to a project

1. Before committing, first check whether you are on the branch you do want to commit to in the list of branches.

2. Then simply click the button labeled "Commit".

3. You will be presented with a list of changes that would be included in the commit. By unfolding the changes and opening a context menu on each individual change you can choose to exclude the change from the commit.

4. After reviewing the changes you can enter the commit message in the text box at the bottom.

5. When you are happy with the commit, you simply finish it by pressing the "Commit" button.

### Using the Git Asset Browser

1. Open the Git Asset Browser either through the Apps menu or by opening the context menu on a project in the Git Browser and selecting "Manage assets".

2. On the left, you can select the project for which you want to manage the assets.

3. You can now import an asset by clicking the "Import file" button. See [below](#supported-asset-types) for a list of supported asset types.

4. Squot will try to infer the asset type from the contents of the file you chose. If it is unable to do so, it will ask you to choose a generic asset type.

5. Based on the name of the file, the Git Asset Browser will suggest a path at which the asset will be stored inside the repository.

6. The path of the newly imported asset will now be listed in the center pane. If you select it (it will be selected immediatly after importing), the asset will be displayed on the right.

7. Below the displayed asset, there is a workspace. It contains instructions to edit the asset via code.

8. After you imported the asset, it is loaded in the system, but not yet committed to the repository. You can follow the

### Importing assets

Besides the method described above, there are some other methods of importing assets.

#### Import directory

You can use the "Import directory" button instead of the "Import file" button. This will recursively import an entire directory. The directory can contain multiple types of assets, as Squot will infer the asset type for each file individually.

#### Import unmanaged assets

You can use the "Import unmanaged assets" button. It is useful when you want to add the assets via an external git tool or the GitHub web interface. To use the button, you have to be on a commit that already contains the assets. Note that you cannot simply merge such a commit into your current branch, since only managed assets will be merged (pulling also performs a merge).

1. If the commit was created outside of the git repository in your Squeak folder (such on GitHub), click the "Fetch all" button to fetch the commit from your remote.

2. If the commit was [created with an external git tool](#using-external-git-tools) on your machine, ensure that you can see it by opening the context menu on the branches panel and checking the "Show git refs" checkbox.

3. Create a branch on the commit or on a descendant of the commit.

4. Switch to the new branch.

5. Open the Git Asset Browser and press the "Import unmanaged assets" button.

6. Commit your newly imported assets.

7. Switch back to the branch you were on before.

8. Merge the branch with the assets.

9. Optionally delete the branch with the assets.

### Using the assets from code

You can use the `GitAssetLoader` class to access the managed assets in your projects:
```smalltalk
| assetLoader form sound |
assetLoader := GitAssetLoader for: 'MyProjectName'.
form := assetLoader loadForm: 'image.png'. "loads /image.png"
"you can add a basePath to the GitAssetLoader:"
assetLoader basePath: 'assets'.
sound := assetLoader loadSound: 'jingle.wav'. "loads /assets/jingle.wav"
"you can also set the basePath with a constructor:"
assetLoader := GitAssetLoader for: 'MyProjectName' basePath: 'assets'.
```

### Supported asset types

Squot can handle these asset types:
- Images (BMP, GIF, JPEG, PCX, PNG, PNM, XBM)
- Animations (GIF)
- Sounds (AIFF, WAV)

Additionally, Squot can track these generic asset types:
- Plaintext (UTF-8)
- BLOB (any binary data)

### Using external git tools

If you try to use an external git tool, like the git command line, on the repository inside your Squeak folder, you will quickly notice that all your branches are gone. The reason for this is that Squot hides its branches (and other refs like HEAD) to protect itself from external changes that would otherwise lead to problems. Nevertheless, there is a way to use external git tools in the same repository as Squeak.

1. In Squeak, open the context menu on the branch or the commit on which you want to work on using the external git tool.

2. Select "Create an external git branch at this commit" and provide a name for it. You can reuse the name you used for the branch in Squeak, as the two branches will not collide.

3. Verify that the branch has been created by opening the context menu on the branches panel once again and checking the "Show git refs" checkbox.

4. In your external git tool, you can now see the (external) branch you just created and work on it.

5. Once you are done working, you can merge the external branch back into the original branch. If you used the external git tool to change the history (for example with git-rebase), you can instead reset the Squeak branch to the external branch.

6. Optionally delete the external branch.
