<div id="top"></div>

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->


<h2 align="center">Wordpress Installer</h2>
  <p align="center">
    Clean WordPress installation from scratch.
  </p>
</div>




<!-- GETTING STARTED -->
## 🏃 Getting Started

To get your WordPress installation running follow these simple steps.

### Prerequisites

#### Local dev
* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Ubuntu](https://ubuntu.com/) or wsl2 on windows
#### Dev server
* Nginx
* Git
* Docker
* Docker Compose

### Init New Project

1. Create new repo from this template
![image](https://user-images.githubusercontent.com/67096472/208317268-896a490c-94ea-44e6-85f4-c17429246aff.png)
2. Add DEPLOY_KEY (private ssh key), DEPLOY_USERNAME, HOST_IP, SSH_HOST to git secret (Find 'WP Docker ENV' base in our onepassword )
3. Clone your repo
4. Go into the created repo folder 
   ```cd ./%your_repo%```
5. Run command for shell scripts
   ```sh 
   find . -type f -iname "*.sh" -exec chmod +x {} \;
   ``` 
<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## 🚀 Usage

### Install
#### (Local development)
1. Modify passwords and variables inside ```.env``` file as you wish, set USE_LOCAL to ```true``` (Find 'WP Docker ENV' base in our onepassword ) 
2. Run shell command for build
   ```sh wp-run.sh ```
3. Active sage template if needed

#### (Deploy to server)
 
1. Run ```sh wp-deploy.sh``` onetime, to pull project
2. Make first commit to repo and push to main

### Uninstall

1. Run shell command
   ```sh wp-uninstall.sh -v -i```
2. Use ```-h | --help``` option for further information

### Execute wp-cli command
1. Run shell command
   ```sh
   sh wp-cli.sh "<command>"
   ```
   to execute your custom wp-cli commands. For example ```sh wp-cli.sh "wp db export -" > dump.sql``` to export wordpress database


### Commits

Commit and push to main branch to run autodeploy on server. <br />
Every commit on main branch generate new tag with commit title

<p align="right">(<a href="#top">back to top</a>)</p>

### Import/export DB

Use ```sh wp-export.sh``` to export current local or RDS DB, it`s stored in ```dump``` folder.<br />
To import DB on remote server manualy, use ```sh wp-import.sh``` command.<br />
To import DB on remote with commit, just run DB export and push to branch with commit ```Update DB```
<p align="right">(<a href="#top">back to top</a>)</p>