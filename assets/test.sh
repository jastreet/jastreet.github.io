script hw1.script
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
find . -name "pastnow"
cd ~/cse374/HW1/
ls -l
chmod u=rwx,g=rx,o=r now
ls -l
cd ~
vi .bashrc
:q
emacs .bashrc
"add alias ll ls -l"
source ~/.bashrc
emacs 
ctrl-z
fg
ps
ps | grep emacs
kill -9 pid
echo $USER is great