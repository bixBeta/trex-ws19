## trex-ws19
TREx Analysis Workshop Source Codes and Tutorials. <br>
The directory structure that we will follow for this tutorial is as follows:

    └── workdir                        
        └── genome
        └── shared_data
            ├── fastqs
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

4. Change your path to the newly created directory using the following command: <br>
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

3. To view the contents of the `shared_data` folder, type `ls /workdir/shared_data/fastqs/` <br>

4. We will now use the `cp` command to copy the appropriate fastq files that are assigned to each user. <br>

5. Use the following command to download the fastq files: `cp /workdir/shared_data/fastqs/raw_file_name.fastq.gz .`
(Replace raw_file_name.fastq.gz with the name that is assigned to you, do not forget the `.` at the end, do this twice for both files) <br>

6. The names of these files are rather long, and we will now use the `mv` command to rename these files. Example, if your sample name is `11317_10135_109976_HFHNGBGXC_1100-W3-3-A549-0hr_CTTGTA_R1.fastq.gz`, we will use the following scheme to rename it: <br> 
`mv 11317_10135_109976_HFHNGBGXC_1100-W3-3-A549-0hr_CTTGTA_R1.fastq.gz W3-A549-0hr.fastq.gz` <br>

#### Run FASTQC:

1. In our fastqs folder, we will run the following command to run the fastqc program. <br>

2. On the command line prompt type `fastqc -o /workdir/netId/fastQC sample1.fastq.gz` 
Once finished, repeat the same command for sample2. <br>

3. The fastqc outputs are stored in the `/workdir/netId/fastQC` folder. Use filezilla to download the .html reports and view them in the browser on your computer. 

#### Run Cutadapt:

1. In the fastqs folder, copy the cutadapt script from the github cloned folder using the following command:<br>
`cp /workdir/netId/trex-ws19/cutadapt.sh .` <br>

2. Execute the script using the following command:<br>
Type ` bash cutadapt.sh ` and hit return. <br>

3. The script is designed to process both samples sequentially. Once finished, the final outputs will be written to the `trimmed_fastqs` folder. <br> 


#### Run STAR alignment:

1. Navigate to the `trimmed_fastqs` folder. <br> 

2. Copy the star alignment script from the git cloned folder to current directory using the following command:<br>
` cp /workdir/netId/trex-ws19/star.sh .` 

3. To execute the star script use the following syntax:<br>
` bash star.sh `

4. Navigate to `STAR` folder. 

5. Run `pip install multiqc`

6. Run multiqc using `multiqc -n star.multiqc.report .` 



