# waybackurls and linkfinder combined
a small project to combine linkfinder with the waybackmachine.

this is a project to combine linkfinder and waybackurls:

https://github.com/GerbenJavado/LinkFinder

https://github.com/tomnomnom/waybackurls

this would download the files directly from the waybackmachine server.

you do need multiple tools to get it to work and need to change line 15 in the bash file to the correct python file for linkfinder.

you need jq, wget, curl, waybackurls, python3 and LinkFinder fully installed.

this does save the files in the same folder so it's reccomanded to start this in a new folder.
the output would be placed in "output.txt" file.

to run it send the command as:
```bash
bash run.sh websiteurl extension
bash run.sh example.com js
```
