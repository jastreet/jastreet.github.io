script hw.1script
mkdir HW1
cd HW1
pwd
echo Linux is great
echo Linux is great > now
date >> now
uname -r >> now
wc -l now
cat now
cp now pastnow
cd ~
find . "pastnow"
cd /udrive/cse374/
ls -l
chmod u+rwx,g+rx now
cd ~
vi .bashrc
:q
emacs .bashrc
"add alias ll ls -l"