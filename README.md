# kingofthehill_tips_and_tricks
king of the hill (koth) tryhackme protect king and tricks by kidnapshadow(sidharth)

 
 ![tryhackme](https://github.com/kidnapshadow-sidharth/kingofthehill_tips_and_tricks/assets/107436833/d3fa19b4-40b2-4e66-affe-93dfef6c6be2)


<h1>Introduction</h1>
King of the Hill (KoTH) is a competitive hacking game, where you play against 10 other hackers to compromise a machine and then patch its vulnerabilities to stop other players from also gaining access. The longer you maintain your access, the more points you get.<br>

But the real challenge for the koth player is defending /root/king.txt . On windows machines king is in C:\king.txt or in C:\Users\Admininstrator\king-server\king.txt.

<h1>patching/defence linux machine</h1>

1. patch of /etc/sudoers
   
   --> nano /etc/sudoers  and remove the root acess permission and save it
   
3. patch of suid
   
   --> chmod -s {suid}
   
   --> ex:- chmod -s /usr/bin/pkexec
   
5. removing ssh keys
   
   --> because if website is vunerable through lfi it might be access ssh id_rsa key so you want to delete the id_rsa key
   
   --> for delete id_rsa key
   
   --> cd /home/user/.ssh
   
   --> ls -la
   
   --> rm id_rsa
   
   --> rm id_rsa.pub

7. LFI patch
   
   --> go to index.php file (/var/www/nginx)
   
   --> nano index.php and  simply erase the php code or you block the lfi with this code
   
   --> <?php include(str_replace("../"," ",$_GET["page"]));?>
   
9. command injection patch
    
   --> go to index.php file
   
   --> nano index.php page and simply erase the full php code or you block the code
   
   --> <?php
        if($_POST['cmd']){
                  ($_POST['cmd']);}?>
   
11. upload vunerbility patch
    
   --> by commenting out that line that save the files on the servers
    
<h1>Protecting the king</h1>

 Undoubtedly, the biggest challenge of KoTH is protecting the king, Let's starts
 
 1. Whiles for protect /root/king.txt using chattr.
    
while [ 1 ]; do chattr -ia /root/king.txt 2>/dev/null; echo -n "YourNick" >| /root/king.txt 2>/dev/null; chattr +ia /root/king.txt 2>/dev/null; done &

3. Mount Trick.
   
sudo lessecho USERNAME > /root/king.txt

sudo dd if=/dev/zero of=/dev/shm/root_f bs=1000 count=100

sudo mkfs.ext3 /dev/shm/root_f

sudo mkdir /dev/shm/sqashfs

sudo mount -o loop /dev/shm/root_f /dev/shm/sqashfs/

sudo chmod -R 777 /dev/shm/sqashfs/

sudo lessecho USERNAME > /dev/shm/sqashfs/king.txt

sudo mount -o ro,remount /dev/shm/sqashfs

sudo mount -o bind /dev/shm/sqashfs/king.txt /root/king.txt

sudo rm -rf /dev/shm/root_f <br>

To undo this, just use umount.<br>

umount -l /root/king.txt or umount -l /root

4. "symbolic link" using "ln" command.
   
cp -r /root/ /dev/shm/...
cd /dev/shm/.../root
rm king.txt
echo "YourNick" > ...
ln -s ... king.txt

6. Chattr for block /root.
   
cd / && chattr +ia root

8. Oneline using date, to combine.
   
while true; do
    chattr -ia /root/king.txt 2>/dev/null
    echo -n "YourNick" >| /root/king.txt 2>/dev/null
    chattr +ia /root/king.txt 2>/dev/null
    sleep $((60 - $(date +%S) % 60))
done &

<h1>Trolling your oppenents </h1>
  
  --> cat /dev/urandom >/dev/pts/<ptsvalue>
  
  (send unlimited error message for your opponent)
  
  also you check out my tool written in bash for trolling opponents @trolling_opponent.sh

  <h1>Finding the flag </h1>

  --> you can use 
  
  1. find / -type f -iname "flag.txt" 2>/dev/null
  
  2. find / -type f -iname ".flag.txt" 2>/dev/null

  3. find / -type f -iname "flag" 2>/dev/null

  4. find / -type f -iname "user.txt" 2>/dev/null

  --> also use can use my tool written in bash for finding the flag  @findflag.sh

  Thanks for love ❤❤ also you check out my blog on medium and blogger
  
  keep playing koth (tryhackme) platform and also tweet on twitter @kidnapshadow_kd

  CREDITS - MatheuZ Security Credits - TryHackMe KOTH

  follow link :-     Medium link :- https://medium.com/@kidnapshadow 

                  Youtube link :- https://youtube.com/@Kidnapshadow

                      Blogger link :- www.kidnapshadow.blogspot.com                                      kidnapshadow(sidharth)
