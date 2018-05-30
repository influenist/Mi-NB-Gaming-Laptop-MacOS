#!/bin/sh
# 
# Initialisation
function init()
{
#
cat << EEF
----------------------------------------
|****** HIDPI - v0.1 - 30-05-2018 ******|
----------------------------------------
EEF
    #
    VendorID=$(ioreg -l | grep "DisplayVendorID" | awk '{print $8}')
    ProductID=$(ioreg -l | grep "DisplayProductID" | awk '{print $8}')
    EDID=$(ioreg -l | grep "IODisplayEDID" | awk '{print $8}' | sed -e 's/.$//' -e 's/^.//')

    Vid=$(echo "obase=16;$VendorID" | bc | tr 'A-Z' 'a-z')
    Pid=$(echo "obase=16;$ProductID" | bc | tr 'A-Z' 'a-z')

    edID=$(echo $EDID | sed 's/../b5/21')

    EDid=$(echo $edID | xxd -r -p | base64)
    thisDir=$(dirname $0)
    thatDir="/System/Library/Displays/Contents/Resources/Overrides"

    Overrides="\/System\/Library\/Displays\/Contents\/Resources\/Overrides\/"

    DICON="com\.apple\.cinema-display"

    nba12sicon=${Overrides}"DisplayVendorID-610\/DisplayProductID-a027-e1e1df.tiff"

    nba12gicon=${Overrides}"DisplayVendorID-610\/DisplayProductID-a027-ebd7bf.tiff"
    
    nba13sicon=${Overrides}"DisplayVendorID-610\/DisplayProductID-a033-e1e1df.tiff"
    
    nba13sgicon=${Overrides}"DisplayVendorID-610\/DisplayProductID-a033-9d9da0.tiff"
    
    nbp15sgicon=${Overrides}"DisplayVendorID-610\/DisplayProductID-a030-9d9da0.tiff"

    if [[ ! -d $thatDir/backup ]]; then
        echo "Backing up"
        sudo mkdir -p $thatDir/backup
        sudo cp $thatDir/Icons.plist $thatDir/backup/
        if [[ -d $thatDir/DisplayVendorID-$Vid ]]; then
            sudo cp -r $thatDir/DisplayVendorID-$Vid $thatDir/backup/
        fi
    fi
}

# CHOOSE NOTEBOOK
function choose_notebook()
{
    #
    mkdir $thisDir/tmp/
    curl -fsSL https://raw.githubusercontent.com/influenist/Mi-NB-Gaming-Laptop-MacOS/master/HIDPI-for-Mi-NB-Gaming-laptops/Icons.plist -o $thisDir/tmp/Icons.plist

#
cat << EOF
----------------------------------------
|******** CHOOSE YOUR NOTEBOOK *********|
----------------------------------------
(1) Mi NoteBook Air 12 - Silver
(2) Mi NoteBook Air 12 - Golden
(3) Mi NoteBook Air 13 - Silver
(4) Mi NoteBook Air 13 - Space Gray
(5) Mi NoteBook Pro 15 - Space Gray

EOF
read -p "Enter your choice[1~5]: " notebook
case $notebook in
    1) NB=("AAAHgAAABDg=" "AAAPAAAACHAA" "AAANwAAAB7wA" "AAAMgAAABwgA" "AAAKrAAABgAA" "12.582678")
Picon=$nba12sicon
RP=("52" "66" "122" "76")
;;
2) NB=("AAAHgAAABDg=" "AAAPAAAACHAA" "AAANwAAAB7wA" "AAAMgAAABwgA" "AAAKrAAABgAA" "12.582678")
Picon=$nba12gicon
RP=("52" "66" "122" "76")
;;
3) NB=("AAAHgAAABDg=" "AAAPAAAACHAA" "AAANwAAAB7wA" "AAAMgAAABwgA" "AAAKrAAABgAA" "13,070866")
Picon=$nba13sicon
RP=("48" "62" "131" "83")
;;
4) NB=("AAAHgAAABDg=" "AAAPAAAACHAA" "AAANwAAAB7wA" "AAAMgAAABwgA" "AAAKrAAABgAA" "13,070866")
Picon=$nba13sgicon
RP=("48" "62" "131" "83")
;;
5) NB=("AAAHgAAABDg=" "AAAPAAAACHAA" "AAANwAAAB7wA" "AAAMgAAABwgA" "AAAKrAAABgAA" "11.1023622")
Picon=$nbp15sgicon
RP=("40" "62" "147" "92")
;;
*) echo "Wrong choice, Bye";
exit 0
;;
esac 

if [[ $Picon ]]; then
    sed -i '' "s/VID/$Vid/g" $thisDir/tmp/Icons.plist
    sed -i '' "s/PID/$Pid/g" $thisDir/tmp/Icons.plist
    sed -i '' "s/RPX/${RP[0]}/g" $thisDir/tmp/Icons.plist
    sed -i '' "s/RPY/${RP[1]}/g" $thisDir/tmp/Icons.plist
    sed -i '' "s/RPW/${RP[2]}/g" $thisDir/tmp/Icons.plist
    sed -i '' "s/RPH/${RP[3]}/g" $thisDir/tmp/Icons.plist
    sed -i '' "s/PICON/$Picon/g" $thisDir/tmp/Icons.plist
    sed -i '' "s/DICON/$DICON/g" $thisDir/tmp/Icons.plist
fi

}

# Main function
function main()
{
    sudo mkdir -p $thisDir/tmp/DisplayVendorID-$Vid
    dpiFile=$thisDir/tmp/DisplayVendorID-$Vid/DisplayProductID-$Pid
    sudo chmod -R 777 $thisDir/tmp/

# 
cat > "$dpiFile" <<-\HIDPI
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>DisplayProductID</key>
            <integer>PID</integer>
        <key>DisplayVendorID</key>
            <integer>VID</integer>
        <key>DisplayProductName</key>
            <string>Color LCD</string>
        <key>DisplayPixelDimensions</key>
            <data>DPDM=</data>
        <key>IODisplayEDID</key>
            <data>EDid</data>
        <key>scale-resolutions</key>
            <array>
                <data>SC1</data>
                <data>SC2</data>
                <data>SC3</data>
                <data>SC4</data>
            </array>
        <key>target-default-ppmm</key>
            <real>PPM</real>
    </dict>
</plist>
HIDPI

    sed -i '' "s/VID/$VendorID/g" $dpiFile
    sed -i '' "s/PID/$ProductID/g" $dpiFile
    sed -i '' "s/DPDM/${NB[0]}/g" $dpiFile
    sed -i '' "s/SC1/${NB[1]}/g" $dpiFile
    sed -i '' "s/SC2/${NB[2]}/g" $dpiFile
    sed -i '' "s/SC3/${NB[3]}/g" $dpiFile
    sed -i '' "s/SC4/${NB[4]}/g" $dpiFile
    sed -i '' "s/PPM/${NB[5]}/g" $dpiFile
}

# Clean up
function end()
{
    sudo cp -r $thisDir/tmp/* $thatDir/
    sudo rm -rf $thisDir/tmp
    echo "Open HiDPI successfully"
    echo "The logo will become very big only at first time"
}

# OPEN
function enable_hidpi()
{
    choose_notebook
    main
    sed -i "" "/.*IODisplayEDID/d" $dpiFile
    sed -i "" "/.*EDid/d" $dpiFile
    end
}

# 开挂
function enable_hidpi_with_patch()
{
    choose_notebook
    main
    sed -i '' "s:EDid:${EDid}:g" $dpiFile
    end
}

# CLOSE
function disable()
{
    sudo rm -rf $thatDir/DisplayVendorID-$Vid 
    sudo rm -rf $thatDir/Icons.plist

    sudo cp -r $thatDir/backup/* $thatDir/

    sudo rm -rf $thatDir/backup
    echo "Close successfully, please restart"
}

function start()
{
    init
# 
cat << EOF

(1) OPEN HIDPI (Try this first)
(2) OPEN HIDPI（Inject EDID）
(3) DISABLE HIDPI

EOF
read -p "Enter your choice[1~3]: " input
case $input in
    1) enable_hidpi
;;
2) enable_hidpi_with_patch
;;
3) disable
;;
*) echo "Wrong choice, bye";
exit 0
;;
esac 
}

start
