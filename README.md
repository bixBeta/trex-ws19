## trex-ws19
TREx Analysis Workshop Source Codes and Tutorials. <br>
The directory structure that we will follow for this tutorial is as follows:

    └── workdir                        
        └── genome
        └── shared_data
            ├── fastQC_all_Samples
            └── STAR_all_Samples
                ├── STAR.COUNTS
                └── star.multiqc.report.html         
        └── netid            
            ├── fastqs  
            ├── fastQC
            ├── trimmed_fastqs
            ├── STAR
            └── trex-ws19

#### Create appropriate directories and Download all scripts:
We will begin by practicing some of the basic Linux/BASH commands. <br> Please use the `Basic Linux Commands CheatSheet` for  referencing command names and their appropriate syntax.  

1. Whenever we login to Cornell's BioHPC server, we will always first land on the storage network. We can use the `pwd` command to see what is our current path, and use `ls` to list any files and or directories that already exist in this path. 
For most users, the directory structure will be: `/home/netID` when they login. <br>

2. All calculations must be done on the workstation's workdir. We will change our directories using the `cd` command to  navigate to the `/workdir`. In the terminal type `cd /workdir` and hit return. <br>

3. Create a new directory inside of workdir on your workstation using the following command: <br>
``` mkdir NetId``` (replace the NetId with your cornell net id) <br>

4. Change your path to the newly created directory by using the following command: <br>
``` cd NetId ``` (replace the NetId with your cornell net id) and create the following new directories by typing: <br>
``` mkdir fastqs fastQC trimmed_fastqs ``` (Note you may specify multiple directories with space in between them to `mkdir` command) <br>

5. Clone this github repository into your workstation using the following command: 
```git clone https://github.com/bixBeta/trex-ws19.git``` <br>
This will download a folder named trex-ws19 which contains all of the shell scripts that will be used throughout the workshop. <br>

6. Change your directory to `fastqs` folder  by typing `cd fastqs` and hitting return. <br>

7. At any point, feel free to use the `pwd` command to check the current path of your directory. Use the `cd` command to navigate into a child folder or a parent folder. <br>

 > Note:
 > To navigate to the parent folder type `cd ..` <br>
 > `..` has a special meaning in bash and this will tell the interpreter that the user is refering to a parent folder. <br>

#### Copy Fastq files:

1. Before we begin, please verify that you are in the fastqs directory by using the `pwd` command. <br> 

2. Inside the fastqs folder, we will copy the fastq files from the shared_data folder. <br>

3. To view the contents of the shared_data folder, type `ls /workdir/shared_data/` <br>

4. We will now use the `cp` command to copy the appropriate fastq files that are assigned to each user. <br>

5. Use the following command to download the fastq files: `cp /workdir/shared_data/sample_name.fastq.gz .`
(Replace sample_name with the names that are assigned to you, do not forget the `.` at the end) <br>

6. The names of these files are rather long, and we will now use the `mv` command to rename these files. Example, if your sample name is `11317_10135_109976_HFHNGBGXC_1100-W3-3-A549-0hr_CTTGTA_R1.fastq.gz`, we will use the following scheme to rename it: `mv 11317_10135_109976_HFHNGBGXC_1100-W3-3-A549-0hr_CTTGTA_R1.fastq.gz W3-A549-0hr.fastq.gz` <br>

#### Run FASTQC:

1. In our fastqs folder, we will run the following command to run the fastqc program. <br>

2. On the command line prompt type `/programs/bin/fastqc/fastqc -o /workdir/netId/fastQC sample1.fastq.gz` 
Once finished, repeat the same command for sample2. <br>

3. 
