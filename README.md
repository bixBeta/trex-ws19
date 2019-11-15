## trex-ws19
TREx Analysis Workshop Source Codes and Tutorials. 

1. Create a new directory inside of workdir on your workstation using the following command: <br>
``` mkdir /workdir/NetId``` (replace the NetId with your cornell net id) <br>

2. Change your path to the newly created directory by using the following command:<br>
``` cd /workdir/NetId ``` (replace the NetId with your cornell net id) <br>

3. Clone the github repository into your workstation using the following command: 
```git clone https://github.com/bixBeta/trex-ws19.git``` <br>
This will download a folder named trex-ws19 which contains all of the scripts that  will be used throughout the workshop.<br>

4. In your parent workdir i.e. `/workdir/NetId`, create a new folder named `fastqs` by typing ` mkdir fastqs` and hitting return.

5. Change your directory to `fastqs` folder  by typing `cd fastqs` and hitting return. <br>

6. At any point, feel free to use the `pwd` command to check the current path of your directory. Use the `cd` command to navigate into a child folder or a parent folder. <br>

 > Note:
 > To navigate to a child folder, simply type `cd` followed by the name of the folder. <br>
 > To navigate to the parent folder type `cd ..` <br>
 > `..` has a special meaning in bash and this will tell the interpreter that the user is refering to a parent folder. <br>

7. Copy all bash scripts from the cloned github repository into your current directory i.e. `/workdir/NetId/fastqs`
by using the following command: <br>
`scp /workdir/trex-ws19/*.sh .`<br>
`*.sh` means all files ending with .sh in bash <br>
The last `.` in the command means current working directory in bash. 


### Download Fastq Files 
The first step is to download all of the fastq files into your current working dir. 
Since each individual will only be using a subset of fastq files, we will need to edit the script first before we can run it. 
To edit the download script, type `nano download.fastqs.sh`<br>

Use the down or up arrow keys to position the cursor in the begining of each line. 
Hit `Ctrl + k` to delete the lines contatining the sample names that are not assigned to you. 

Once done, hit `Ctrl + x` and type `y` and hit return. 
