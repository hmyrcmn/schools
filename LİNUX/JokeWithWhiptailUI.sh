!bin/sh
yuzde=90
if (whiptail --yesno "DO you lıke me?" 10 100) then
 echo "Yes! congratulations you passed the test :) "
else
 echo "No!"
{
 for i in {0..100..10}
 do
 sleep 1
if [ $i -eq $yuzde ]
 then
`shutdown -h now`
sleep 1
break

fi

 echo $i
 done
} | whiptail --gauge "your computer crashes :)" 6 60 0
fi

