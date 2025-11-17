
rm -rf .git* # Force download modules from official repo

if [ $(uname -m | grep 'x86_64') ]; then
   make distrib

   if [ $? -eq 0 ]
   then
     # Result is OK! Just continue...
     echo "Make all... PASS!"
   else
     # houston we have a problem
     exit 1
   fi

   make man
   make install

   if [ $? -eq 0 ]
   then
     # Result is OK! Just continue...
     echo "Make install... PASS!"
   else
     # houston we have a problem
     exit 1
   fi

else
   make AFL_NO_X86=1 distrib

   if [ $? -eq 0 ]
   then
     # Result is OK! Just continue...
     echo "Make all... PASS!"
   else
     # houston we have a problem
     exit 1
   fi

   make man
   make install

   if [ $? -eq 0 ]
   then
     # Result is OK! Just continue...
     echo "Make install... PASS!"
   else
     # houston we have a problem
     exit 1
   fi

fi
