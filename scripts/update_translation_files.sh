#!/bin/sh

# Update pot
xgettext --keyword=_ --keyword=ngettext:1,2 --language=Python --no-location --sort-output \
    -o resource/locales/MixwareScreen.pot \
    *.py \
    resource/*.py \
    panels/*.py \
    resource/defaults.conf
# Update po
for FILE in resource/locales/*; do
    if [ -d $FILE ]; then
        echo Processing $FILE
        msgmerge -q $FILE/LC_MESSAGES/MixwareScreen.po \
                 resource/locales/MixwareScreen.pot \
              -o $FILE/LC_MESSAGES/MixwareScreen.po
        # Clean Fuzzy translations
        msgattrib --clear-fuzzy --empty -o $FILE/LC_MESSAGES/MixwareScreen.po $FILE/LC_MESSAGES/MixwareScreen.po
        # Compile mo
        msgfmt -o  $FILE/LC_MESSAGES/MixwareScreen.mo $FILE/LC_MESSAGES/MixwareScreen.po
    fi
done
