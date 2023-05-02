# DT_Texture_Sort
Sire Melk sponsored Script for:
* creating .csv dictionary of relative paths and filenames in target folder
* sorting files in accordance with .csv dictionary into folders.

.csv here are a baseline - the way textures are referenced in game bundles. 
- Full - has all files as they are described in bundles - with a lot of duplicates (hence only copy mode works with it as it should) You probably don't want it unless you want to turn your 16k files limn export into a 93k+ ~150GB monstrosity.
- Unduped by data - Only unique files remain, they are still end up clustered by object. Especially fo character parts and weapons (they seem not to suffer  duplication almost at all) Typical folder contains all textures: diffuse, normal map, AO/Metallic/Roughness combo, alpha maps for skins and all that jazz. Unduped slims Update9 textures from 16k to 15k (1k difference is the files with distinct names, but byte-to-byte copies of other textures, mainly huge mono-colored 4k*4k squares and a million of identical ui icons)

Usage:
As prerequisite you extract DarkTide textures with [limn](https://github.com/ManShanko/limn). You'll plug folder with textures as input for sorting.

Right click this thing and select "Run with PowerShell". You will be prompted with two choices:
1. [S]ort Textures
   - dialog to choose input folder with your textures(can be nested and whatnot)
   - dialog to choose output folder
   - dialog to choose .csv (shows all files matching DT_Tex*.csv pattern)
   - asks if you want to [C]opy or [M]ove files from input folder to output one

3. [C]reate Dictionary
   - dialog to choose input folder to create .csv of its content

Script itself has nothing to do with DarkTide directly. .csv in repository, however, is a per-bundle-sorted version of DT textures @patch8. 
And I had some fun trying to imagine how Melk's ogryn targeted auspex spam ad would look like ($ugeBoxBad = $true at line 3 disables it. Can't imagine anyone wanting to look at it more than once).
