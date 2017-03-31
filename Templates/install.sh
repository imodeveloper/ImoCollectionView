
#!/bin/bash
abort()
{
    echo >&2 '
***************
*** ABORTED ***
***************
'
    echo "An error occurred. Exiting..." >&2
    exit 1
}

trap 'abort' 0
set -e

#IFS stands for "internal field separator".
#It is used by the shell to determine how to do word splitting, i. e. how to recognize word boundaries.
IFS=$'\n'   #internal field separator

resultsArray=()
resultsArray=(`find /Applications -type d -maxdepth 1 -name "Xcode*.app" -print`) 

for i in "${resultsArray[@]}"
do :

	#BASEDIR=$HOME

	XCODE_TEMPLATE_DIR="$i"/Contents/Developer/Library/Xcode/Templates/File\ Templates
	FULLTEMPLATESDIR="$XCODE_TEMPLATE_DIR/ImoCollectionView/"

	echo "Templates will be installed to ${FULLTEMPLATESDIR}"

	if [ -d "${FULLTEMPLATESDIR}" ]; then
	    sudo rm -rf "${FULLTEMPLATESDIR}"
	fi

	sudo mkdir -p "${FULLTEMPLATESDIR}"
	sudo cp -r *.xctemplate "${FULLTEMPLATESDIR}"

done

trap : 0

echo >&2 '
************************************************
*** MMMODULES TEMPLATES COPYED SUCCESSFULLY **** 
************************************************
'
