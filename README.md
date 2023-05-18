# 📚 Nextcloud on Docker using Ansible

🎉 Welcome to this comprehensive guide on automating the deployment and configuration of Nextcloud on Docker using Ansible. This guide is intended to serve as an in-depth resource for understanding how to set up a local Nextcloud server located behind a DS-Lite internet connection. We use Ansible to automate the deployment process, including the creation of a port mapping server with a public IPv4 address that can be linked to a private domain, making your local Nextcloud server accessible via the internet.

## 🗂️ Project Structure

The project is organized into various playbooks and roles, each serving a specific purpose in the automation process. Here's a brief overview of the key files and directories:

- [`ansible.cfg`](ansible.cfg): This is the main Ansible configuration file, controlling the behavior of Ansible in this project.
- [`inventory.yml`](inventory.yml): This file contains a list of the hosts (servers) where the playbook will be run.
- [`main.yml`](main.yml): The main playbook that orchestrates the whole setup process. It includes different roles and tasks based on the needs.
- [`roles`](roles): This directory contains roles downloaded from Ansible Galaxy which serve specific purposes like setting up Docker, pip and system security.
- [`server-config`](server-config): This directory contains the playbooks and templates for the Nextcloud and Docker configurations.
- [`group_vars`](group_vars): This directory contains files defining variables that will be used across multiple hosts.
- [`secure_server.yaml`](secure_server.yaml): This playbook ensures the server is secure and up-to-date.

## 🎯 Playbooks 

These playbooks orchestrate the automation process, each focusing on different aspects of the server setup and Nextcloud deployment.

- [`configure_server.yml`](server-config/configure_server.yml): Prepares the server for the Nextcloud installation, setting up necessary packages and settings.
- [`configure_authorization.yml`](server-config/configure_authorization.yml): Handles the server's authorization setup, ensuring that only authorized users can access the server.
- [`configure_portmapper.yml`](server-config/configure_portmapper.yml): Sets up the portmapper to allow the Nextcloud server to be accessible from the internet via a public IPv4 address.
- [`nextcloud_in_docker.yml`](server-config/nextcloud_in_docker.yml): Sets up Nextcloud inside a Docker container, ensuring isolation and easy management.
- [`backup_nextcloud_data.yaml`](server-config/backup_nextcloud_data.yaml): Creates backups of Nextcloud data, ensuring data safety and availability.
- [`reverse-proxy.yml`](server-config/reverse-proxy.yml): Sets up a reverse proxy, enabling the Nextcloud server to handle requests from the internet efficiently.
- [`prequisites.yaml`](server-config/prequisites.yaml): Handles the installation of necessary prerequisites for the setup.
- [`docker.yml`](server-config/docker.yml): Sets up Docker, which is crucial for running Nextcloud inside a container.

## 🏷️ Roles

The project uses three roles from Ansible Galaxy to manage the installation and setup of necessary packages and configurations:

- `geerlingguy.docker`: This role ensures Docker and Docker Compose are installed.
- `geerlingguy.pip`: This role manages Python pip packages.
- `dev-sec.os-hardening`: This role provides numerous security-related configurations, providing all-round base protection.

## 🚀 Getting Started

1. **Update the Variables**: Several variables are used throughout the playbooks and roles. Certain files require direct updates to their variables. 

    List of variables to be replaced:

    - In [`ansible.cfg`](ansible.cfg):
        - `<CONTROL_NODE_USER>`: replace with your control node username.

    - In [`inventory.yml`](inventory.yml):
        - `<YOUR.SERVER.IP>`: replace with your server's IP address.
        - `<PRIVATE_DOMAIN>`: replace with your private domain name.

    - In [`configure_portmapper.yml`](server-config/configure_portmapper.yml):
        - `<YOUR.PORTMAPPER.DOMAIN>`: replace with your Portmapper domain.
        - `<PORTMAPPER_DB_PASSWORD>`: replace with your chosen Portmapper database password.

    - In [`nextcloud_in_docker.yml`](server-config/nextcloud_in_docker.yml):
        - `<YOUR.NEXTCLOUD.DOMAIN>`: replace with your Nextcloud domain.
        - `<NEXTCLOUD_DB_PASSWORD>`: replace with your chosen Nextcloud database password.

    - In [`group_vars/all.yml`](group_vars/all.yml):
        - `<MYSQL_ROOT_PASSWORD>`: replace with your MySQL root password.
        - `<MYSQL_USER>`: replace with your MySQL user.
        - `<MYSQL_PASSWORD>`: replace with your MySQL password.
        - `<MYSQL_DATABASE>`: replace with your MySQL database name.
        - `<NEXTCLOUD_ADMIN_USER>`: replace with your Nextcloud administrator username.
        - `<NEXTCLOUD_ADMIN_PASSWORD>`: replace with your Nextcloud administrator password.
        - `<PRIVATE_DOMAIN>`: replace with your private domain name.
        - `<PUBLIC_DOMAIN>`: replace with your public domain name.
        - `<EMAIL>`: replace with your email.
        - `<CONTROL_NODE_USER>`: replace with your control node username.
        - `<PHP_MEMORY_LIMIT>`: replace with your desired PHP memory limit.
        - `<PHP_MAX_EXECUTION_TIME>`: replace with your desired PHP maximum execution time.
        - `<PHP_UPLOAD_MAX_FILESIZE>`: replace with your desired PHP maximum upload file size.
        - `<PHP_POST_MAX_SIZE>`: replace with your desired PHP maximum POST size.
        - `<MYSQL_HOST>`: replace with your MySQL host.
        - `<MYSQL_DATABASE>`: replace with your MySQL database name.
        - `<REDIS_HOST>`: replace with your Redis host.
        - `<REDIS_PORT>`: replace with your Redis port.

    - In [`backup_nextcloud_data.yaml`](server-config/backup_nextcloud_data.yaml):
        - `<YOUR.NEXTCLOUD.DOMAIN>`: replace with your Nextcloud domain.

    - In [`reverse-proxy.yml`](server-config/reverse-proxy.yml):
        - `<YOUR.NEXTCLOUD.DOMAIN>`: replace with your Nextcloud domain.
        - `<EMAIL>`: replace with your email.

    - In [`prequisites.yaml`](server-config/prequisites.yaml):
        - `<CONTROL_NODE_USER>`: replace with your control node username.

    - In [`docker.yml`](server-config/docker.yml):
        - `<CONTROL_NODE_USER>`: replace with your control node username.

    - In [`nextcloud_php_config.j2`](server-config/templates/nextcloud_php_config.j2):
        - `<PHP_MEMORY_LIMIT>`: replace with your desired PHP memory limit.
        - `<PHP_MAX_EXECUTION_TIME>`: replace with your desired PHP maximum execution time.
        - `<PHP_UPLOAD_MAX_FILESIZE>`: replace with your desired PHP maximum upload file size.
        - `<PHP_POST_MAX_SIZE>`: replace with your desired PHP maximum POST size.
        - `<MYSQL_HOST>`: replace with your MySQL host.
        - `<MYSQL_USER>`: replace with your MySQL user.
        - `<MYSQL_PASSWORD>`: replace with your MySQL password.
        - `<MYSQL_DATABASE>`: replace with your MySQL database name.
        - `<REDIS_HOST>`: replace with your Redis host.
        - `<REDIS_PORT>`: replace with your Redis port.

2. **Run the Playbooks**: Use Ansible to run the [`main.yml`](main.yml) playbook. This will automatically configure your server, install necessary packages, set up Nextcloud inside a Docker container, and ensure your Nextcloud server is accessible via the internet. 

    After executing, you can access your Nextcloud instance by navigating to the domain name you configured in your web browser.

## 🔧 Customize the Setup

You can customize the setup process by modifying the playbooks and roles according to your requirements. For example, you might want to add additional roles for monitoring the server or automating the renewal of SSL certificates.

## 🌐 Networking Setup

Ensure that your local server is configured to allow traffic to the ports used by Nextcloud and the reverse proxy. This typically involves configuring your router to forward traffic to your server.

## 📚 Additional Resources

For more information about Ansible, Docker, and Nextcloud, you can refer to the following resources:

- [Ansible Documentation](https://docs.ansible.com/)
- [Docker Documentation](https://docs.docker.com/)
- [Nextcloud Documentation](https://docs.nextcloud.com/)

🌟 Enjoy automating your Nextcloud setup with this project!
