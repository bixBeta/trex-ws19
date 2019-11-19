#### Cisco VPN

For off-campus access to the cbsulm08 server, first connect to vpn using <a href="https://it.cornell.edu/cuvpn"> Cisco VPN </a> using `cuvpn.cuvpn.cornell.edu`. 
Login using Cornell's user name and password.  


#### Run STAR
Once logged in to the cbsulm08 using putty/terminal, navigate to the appropriate directory using <br>  `cd /workdir/<netId>/trimmed_fastqs`<br>

Check memory availablility with `htop`. If the usage is ≤ 300G, feel free to start the `STAR` run. 


Run the following command to export the STAR path:
`export PATH=/programs/STAR:$PATH` 

Remove the `../STAR` directory if it already exists by typing `rm -r ../STAR`. 

Start the alignment using ` nohup bash star.sh & `

You may exit terminal at this point and  disconnect the vpn. `STAR` will keep running on cbsulm08 in background. 

You may repeat the diretions above to log in again and check on the `STAR` run or copying files locally using filezilla and uploading it to UCSC/IGV genome browser. 




