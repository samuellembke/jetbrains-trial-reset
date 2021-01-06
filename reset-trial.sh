#!/bin/bash
#
# This will reset the trial of all jetbrain products that it can find on your system
# This is only for extending the trial of the products to evaluate further if want to buy or not.
# You should buy these products if you use them regularly

echo 'Resetting...'

possible_products=(DataGrip2020.3 IntelliJIdea2020.3 PhpStorm2020.3 WebStorm2020.3)

eval_strings=(evlsprt.203 evlsprt2.203 evlsprt3.202 evlsprt3.203)

for i in ${possible_products[@]}; do
        echo 'Removing eval-file for: '$i
        rm -R ~/.config/JetBrains/$i/eval &> /dev/null
        echo 'Removing license relations in other.xml for: ' $i
        for e in ${eval_strings[@]}; do
                xmlstarlet ed -L -d "/application/component/property[@name='"$e"']" ~/.config/JetBrains/$i/options/other.xml
        done
done
echo 'Done.'
exit 0
