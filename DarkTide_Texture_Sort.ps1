
### Turn off 'UGE BOX advertisement
$ugeBoxBad = $false # use $true 

<#
  v0.1 
  Script for:
  
  a) creating .csv dictionary of relative paths and filenames in target folder 
     recursively  for .dds|.bmp|.png as it seems a common path of extractning 
	 into something that is small-ish and not .dds (limn>texconv>ffmpeg).
	 Does not write file extensions in .csv, so you can make .csv of whatever
	 extensions and then sort whatever other ones.

  b) sorting files in accordance with .csv dictionary into folders. 
     Uses only filenames ignore file extensions

  Script itself has nothing to do with DarkTide directly. 
  .csv in repository, however, is a per-bundle-sorted version of DT textures.
  And I had some fun trying to imagine how Melk's ogryn targeted auspex spam 
  ad would look like.
  
  Maybe it needs a bunch of testimonials and just one given by random every time.
  Maybe in ugeBoxBad mode even, eh?
#>

### Advertisement
### ------------------------------------------------------------
Write-Host "`n IRISS: Inquisitorial Reconnaissance Imagery Sorting Script v0.1"
Write-Host "  Moebian Domain, Atoma Prime, voidship Mourningstar; X336023M42`n"


$adv1 = "                        THIS AUSPEX SCRIPT IS SPONSORED BY"
$adv2 = @"
                         _____           __  ___    ____  _                  
                        / __(_)______   /  |/  /__ / / /_( )___              
                       _\ \/ / __/ -_) / /|_/ / -_) /  '_//(_-<              
          ___  _______/___/_/_/__\__/_/_/__/_/\__/_/_/\_\_/___/___  ____  ___
         / _ \/ __/ __ \/ / / /  _/ __/  _/_  __/ __ \/ _ \/  _/ / / /  |/  /
        / , _/ _// /_/ / /_/ // /_\ \_/ /  / / / /_/ / , _// // /_/ / /|_/ / 
       /_/|_/___/\___\_\____/___/___/___/ /_/  \____/_/|_/___/\____/_/  /_/  
"@
$adv3 =	@"		   

             TIRED OF STANDARD 'BIG BOX' BEING TOO MINISCULE FOR YOU? 
         IT'S TOO SMALL AND SLIPS THROUGH YOUR MIGHTY FINGERS ALL THE TIME?

                                      TRY    
"@									  
$adv4 = @"
               _ _     _  ______ _______    ______   _____ _    _   
              ( ) |   | |/ _____|_______)  (____  \ / ___ \ \  / / 
              |/| |   | | /  ___ _____      ____)  ) |   | \ \/ / 
                | |   | | | (___)  ___)    |  __  (| |   | |)  (   
                | |___| | \____/| |_____   | |__)  ) |___| / /\ \ 
                 \______|\_____/|_______)  |______/ \_____/_/  \_\
"@
$adv5 = @'		
................................................................................
...................................         ....................................
..........                                  ....................................
......... .^^^^^~~~~~~~~!!!!!!!!!!!!!!777!J~ ...................................
......... !J~~~~~~~~^^^^^^^^^^^^:::::::::^5. ...................................
........  Y~:::::::::::::::::::::::::::::J! ....................................
........ ^Y:::::::::::::::::::::::::::::~Y  ....................................
........ ?7:::::::::::::::::::::::::::::Y:                ......................
....... .5^::::::^!!!!!!!!!!!!!!!!!!!!!Y5^~~~~~~^^^::...                  ......
....... ~J::::::~B&&&@@@@&#GP55YY?77777??Y55YYJJY55PPPPP55YJJ?7!~~^::..... .....
....... J!:::::.J@~:^^~!7?JY5555YJ7!^:. ..............::~!7?Y5PGB#@@&&#BB7  ....
...... .5::::::.Y@:          .:^~7?Y55G#BGPP5555555YJJ?JY555YYYJJ??77!~#B. .....
...... !?::::::.Y@: ~J!7. .           J@~. .....    ....              .#P  .....
.....  Y~::::::.5@: ~J !? ...  ~7~^.  5&..!..                   .:~^  ^@J ......
..... ^Y:::::::.5&: :Y. Y: . .77.7J.  G# ~5~!!~^:.         .:^~!!~~Y  !@! ......
..... ?7:::::::.5&:  7? ~J  ~?^.?7.  .#P ~?  .:~!!!~^:..:~!!!^:. .~Y  J@: ......
.... .5^:::::::.5&:   Y: Y~77 ^J^  . ^@J ^J~~^:.  .:^~!!~^...:~!!!^.  5&. ......
.... ~Y::::::::.5&: . ^J ^J: 7?. ... !@!  .:^~~!!!~^.    .!!!~^.      G#. ......
.... J!::::::::.5&: . .5:  .?!  .... 7@~ .      ...Y^ .  ^5           BB  ......
... .5::::::::::P#.  .J^~Y.^Y  ..... ?@^ .....   .~J.    :7!!~~^::.   BG  ......
... !?::::::::::G#. .J~77!? 77 ..... J@^ ..   .^77^.  .^!~^^^:^^~~!J. BG  ......
..  Y~:::::::::.GB..J7?!  Y^ Y^ .... Y@: .  ^!7~.  :~!7~::^~~!!!~~^5^ #G  ......
.. ^5::^^^^^^~~~BB .~!^   ^Y :Y. ... Y@:  .J!:  :!7!^.         ..:^~..#G  ......
.. ~?!!!!!!~~~~^P&~.    .. !7!Y7 ..  P&.  .5.^!7~:.   .......        .#G  ......
...             .?GGY!:      .:: ..  GB   .J7~:    ....       .:^!?J55#G. ......
...  ...........   ^?5GPJ~:     ... .#G  .      .       .^!?Y5PP5Y?!~^:.. ......
..................    .~?5GPJ~.     .&5  ..       .:~7YPPPY?!^:.        ........
.....................     .~?PG5?~. :@J     .:~7J5PP5J!^.        ...............
.........................     :~JPGP5#7~7J5PPP5J7~:.      ......................
.............................     :~JPP5J7~^.        ...........................
.................................     .        .................................
.....................................  .........................................
................................................................................

                  IT'S A BOX FULL TO THE BRIM WITH BIG BOXES! 
       EVEN TRAITOR TITANS STAND NO CHANCE, IF WIELDED WITH RIGHTEOUSNESS!
			 
 Testimonials:
  "Is big enough for me. I throw 'UGE BOX and it breaks into[counts his fingers] 
   one-two-three[loses count]. Ma-any big boxes. And big boxes break into many 
   grenu... grinah... 'Splosive things that boom real good. I luv it!" - Crud 
'@

$advMicro = @"
                    THIS AUSPEX SCRIPT IS SPONSORED BY
                        Sire Melk's Requisitorium
						 
"@


###--------------------------------------------------------------------------


### moving / copying textures switch
[bool] $moveMode = $false 
###---------------------------------------------------------------------------

### colored output for stuff
function Write-ColorHost($ForegroundColor)
{
    # save the current color
    $fc = $host.UI.RawUI.ForegroundColor

    # set the new color
    $host.UI.RawUI.ForegroundColor = $ForegroundColor

    # output
    if ($args) {
        Write-Host $args
    }
    else {
        $input | Write-Host
    }

    # restore the original color
    $host.UI.RawUI.ForegroundColor = $fc
}

if($ugeBoxBad){
	Write-ColorHost green $advMicro
} else {
	Write-ColorHost green $adv1
	Write-ColorHost yellow $adv2
	Write-ColorHost green $adv3
	Write-ColorHost red $adv4
	Write-ColorHost green $adv5
	Write-ColorHost yellow "`n'Uge Box ads are optional. To opt out set `$ugeBoxBad=`$true at line 3`n"
}

#folder/file select forms
Add-Type -AssemblyName System.Windows.Forms
### Ask for path to folder
function Get-Folder($st){
    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
	$dialog.Description  = "Select $st folder"
	$dialog.SelectedPath = Get-Location
	
    $result = $dialog.ShowDialog()
    if ($result -eq [Windows.Forms.DialogResult]::OK){
        $selected = $dialog.SelectedPath
    }
    $dialog.Dispose()
    # return selected folder
    return $selected
}

function Get-File{
    $dialog = New-Object System.Windows.Forms.OpenFileDialog
    $dialog.InitialDirectory = Get-Location
    $dialog.filter = "CSV (*.csv) | DT_Tex*.csv"
	$result = $dialog.ShowDialog()
    if ($result -eq [Windows.Forms.DialogResult]::OK){
        $selected = $dialog.FileName
    }
    $dialog.Dispose()
    return $dialog.FileName
}

###
function Create-Dictionary ($pth){
	$csvName = "DT_Tex_$(get-date -f yyyy-MM-dd_HH_mm).csv"
	$csvPath = [System.IO.Path]::GetFullPath($csvName) 
	#{} | Select "filename","path" | Export-Csv $csvPath
	$rows = @()
	#move working location to texture folder to get relative paths
	Push-Location $pth
	
	$i =0
	Get-ChildItem $pth -Recurse -File -include *.dds,*.bmp,*.png | ForEach-Object {   
	
		#get relative path
	    $rel = Resolve-Path -Path $_.DirectoryName -Relative
		
		#append data
		$rows += [pscustomobject]@{
			filename = $_.BaseName
			path = $rel
		}


		#Resolve-Path -Path $rel| Write-Host
		$i++
		if (0 -eq $i % 500){
			Write-Progress -Activity "Creating dictionary. $i files found." 
		}
	
	
	}
	#return working location back
	Pop-Location
	#write files and paths into .csv
	$rows | Export-Csv -Path $csvPath -NoTypeInformation
	
	Write-ColorHost green "`nDone. $i files found, dictionary $csvName created.`n"
	return $true
}

###
function Sort-Textures ($inPth, $outPth, $dictPth, $move){
	
	$csv = Import-Csv -Path $dictPth
	
	#move working location to texture folder to get relative paths
	Push-Location $outPth
	
	$csvL = $csv.Length
	$inF = (Get-ChildItem $inPth -Recurse -File | Measure-Object).Count
	
	if ($csvL -ge $inF){ Write-ColorHost green "`n $csvL in dictionary / $inF in input`n"}
	else {  Write-ColorHost red "`n Dictionary has less files than input folder! $csvL in dictionary / $inF in input`n"}
	
	$i = 0
	$j = 0
	#iterate through csv rows
	foreach ($file in $csv){
		$i++
		#get output path
		$pth = [IO.Path]::GetFullPath([IO.Path]::Combine((Get-Location -PSProvider FileSystem).ProviderPath, $file.path))
		#create subfolder if doesn't exist
		If(!(test-path -PathType container $pth)){New-Item -ItemType Directory -Path $pth | Out-Null }
		#find file in input folder recursively and move or copy it to output
		Get-ChildItem $inPth -Recurse -File -Filter ($file.filename + '*') | ForEach-Object {   
		    
			if ($move){
				Move-Item $_.FullName -Destination $pth
			}else{
				Copy-Item $_.FullName -Destination $pth
			}
			$j++
		}
		if (0 -eq $i % 100){
			Write-Progress -Activity "Sorting: $i / $csvL." 
		}
		
	}
	#return working location back
	Pop-Location
	Write-ColorHost green "Done. $j / $csvL found."
	
	return $true
}



###Dictionary Create / Texture Sort mode select prompt
$title    = ""
$question = "Please select operation mode"
$choices  = "&Sort Textures","&Create Dictionary from existing folder structure"
$modeDecision = $Host.UI.PromptForChoice($title, $question, $choices, 0)

[string] $inputPath = ""
[string] $sortedPath = ""
$ret = $false
if ($modeDecision -eq 0) {

    Write-ColorHost green "`nSort Textures Mode`n"
	
	#try get texture folder path as input
	$inputPath = Get-Folder "input"

	#try get sorted texture folder path as output
	$sortedPath = Get-Folder "output"
	
	#get dict file
	$csvPath = Get-File
	
	$choices  = "&Copy","&Move"
	$moveDecision = $Host.UI.PromptForChoice(" ", "Copy or Move files from input folder to output?", $choices, 0)
	if ($moveDecision -eq 1) { $moveMode = $true }
		
	
	if (![string]::IsNullOrEmpty($sortedPath) -and ![string]::IsNullOrEmpty($sortedPath) -and ![string]::IsNullOrEmpty($csvPath)){
		$ret = Sort-Textures $inputPath $sortedPath $csvPath $moveMode
	}
	#sorting stuff
	
} else {
	
	Write-ColorHost green "`nCreate Dictionary Mode`n"
	
	#try get sorted texture folder path as input until it's a valid existing folder
	$sortedPath = Get-Folder "input"

	if (![string]::IsNullOrEmpty($sortedPath)){
		$ret = Create-Dictionary $sortedPath
	}
	#dictionary stuff

	
}


Read-Host -Prompt "Press Enter to exit"
