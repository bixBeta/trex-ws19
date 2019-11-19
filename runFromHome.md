#### Cisco VPN

For off-campus access to the cbsulm08 server, first connect to vpn using <a href="https://it.cornell.edu/cuvpn"> Cisco VPN </a> using cuvpn.cuvpn.cornell.edu. 
Login using Cornell's user name and password.  


#### Run STAR
Once logged in to the cbsulm08 using putty/terminal, navigate to the appropriate directory using <br>  `cd /workdir/<netId>/trimmed_fastqs`<br>

Run the following command to export the STAR path:
`export PATH=/programs/STAR:$PATH` 

Remove the `../STAR` directory if it already exists by typing `rm -r ../STAR`. 

Run the alignment using ` nohup bash star.sh & `


