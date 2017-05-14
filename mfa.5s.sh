# GNOME MFA script for Argos Extension.
# Copyright © 2017 Dani Perez
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# File containing the seeds.
SECRETS_FILE=$HOME/.config/gnome-mfa/mfa.txt

# TOTP expiration time for tokens 
EXPIRATION_SECONDS=30

#
# Checks the secrets file
#
function check_secrets {

    SECRETS_FILE=$1
	EXPECTED_MASK=400

    if [ ! -f "$SECRETS_FILE" ]; then
        echo ":key: | color='red'"
        echo "---"
        echo "<i>File \"$SECRETS_FILE\" cannot be read</i> | color='red'"
        return 1
    elif [ ! "$(stat -c %a $SECRETS_FILE)" == "$EXPECTED_MASK" ]; then
        echo ":key: | color='red' refresh=true"
        echo "---"
        echo "<i>File \"$SECRETS_FILE\" found but expected to be protected:</i> | color='red'"
        CHMOD="chmod $EXPECTED_MASK $SECRETS_FILE"
		echo "    $CHMOD | $(enable_copy_paste "$CHMOD") font=monospace color='red' trim=false"
        echo "<i>Current mask: $(stat -c %a $SECRETS_FILE)</i> | color='red'"
        return 1
    else
        echo ":key: | refresh=true"
        echo "---"
        return 0 
    fi
}

#
# Prints the string needed to configure Argos to copy&paste the given command ($1).
#
function enable_copy_paste {

 echo "bash='echo -n $1 | xclip -selection c && echo -n $1 | xclip' terminal=false"
}

#
# Prints the given title ($1) and secret ($2) as a row for Argos.
#
function show {

 TITLE="$1"
 SEED="$2"
 SECRET="$(oathtool --totp $SEED)"
 ICON="$3"

 printf "<b>%-20s</b>" $TITLE
 printf "%s" $SECRET
 echo " | $(enable_copy_paste $SECRET) refresh=true iconName=$ICON"
}

if check_secrets "$SECRETS_FILE"; then

    OLDIFS=$IFS; IFS=','; 
    while read TITLE SEED ICON; do 

        show $TITLE $SEED $ICON

    done < $SECRETS_FILE
    IFS=$OLDIFS

    echo "---"
    echo "<i>$(($(date  +"%S")%$EXPIRATION_SECONDS))</i> | color='red'"
fi


