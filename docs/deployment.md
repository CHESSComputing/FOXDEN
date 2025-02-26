# FOXDEN Deployments

FOXDEN can be deployed in different ways depending on your needs. This guide covers two primary deployment methods:

- **Central Deployment** – Installs all FOXDEN services on a single node or across multiple nodes.  
- **Local Deployment** – Installs a minimal set of core services for local use.  

---

## Central Deployment

The central deployment method installs all FOXDEN services on either a **single node** or **multiple nodes**. Follow these steps to set up a central deployment:

### Prerequisites

Ensure your system meets the following requirements:

- Install the latest Go compiler from [Go’s official site](https://go.dev/doc/install).
- Install Git on your node(s).
- Prepare your FOXDEN configuration file (see [Configuration](configuration.md)).

### Installation Steps

1. Clone the FOXDEN scripts repository:
   ```sh
   git clone git@github.com:CHESSComputing/scripts.git
   ```

2. Clone all FOXDEN repositories:
   ```sh
   ./scripts/git-clone-all.sh
   ```

3. Compile all repositories:
   ```sh
   ./scripts/make.sh
   ```

4. Start all FOXDEN services:
   ```sh
   ./scripts/manage start
   ```

At this point, all FOXDEN services should be running.  

### Upgrading FOXDEN

To update and maintain your FOXDEN deployment:

```sh
# Pull the latest upstream changes or modify the codebase
./scripts/git-pull.sh

# Optionally, push your local changes
./scripts/git-push.sh

# View the latest tags
./scripts/git-last-tag.sh

# Create a new tag (e.g., v0.2.1)
./scripts/git-tag.sh v0.2.1

# Push tags to the repository
./scripts/git-push-tags.sh

# Recompile FOXDEN services
./scripts/make.sh

# Restart services
./scripts/manage restart
```

---

## Local Deployment

The local deployment method installs a subset of essential FOXDEN services, making it ideal for lightweight usage and development.  

### Installed Services

The local deployment includes the following services:

- **Authz** – Authentication and authorization service  
- **MetaData** – Metadata management service  
- **DataDiscovery** – Data discovery service  
- **DataBookkeeping** – Data provenance service  
- **Frontend** – FOXDEN's frontend service  

### Installation Steps

To install the local deployment, follow these steps:

```sh
# Download the installer script
curl -ksLO https://raw.githubusercontent.com/CHESSComputing/scripts/refs/heads/main/installer.sh

# Set executable permissions for the script
chmod +x installer.sh

# Run the installer script, specifying the installation directory
./installer.sh <foxden_install_directory>
```

### Local Storage Setup

The local deployment uses embedded databases for storing data:

- **SQLite** – Used for DataBookkeeping (provenance) and Authz services.  
- **MongoDB** – Used for the MetaData service.  

Additionally, the installer will generate the appropriate FOXDEN configuration file.

---

Both deployment options offer flexible setups to meet different needs, whether
you require a **full multi-node deployment** or a **lightweight local
installation**.
