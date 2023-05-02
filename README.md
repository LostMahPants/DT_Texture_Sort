# DT_Texture_Sort
Sire Melk sponsored Script for:
* creating .csv dictionary of relative paths and filenames in target folder
* sorting files in accordance with .csv dictionary into folders.

Usage:
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
