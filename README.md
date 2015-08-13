# pvpc-infra
#### VM setup
1. Install Vagrant and Ansible
```bash
sudo apt-get install vagrant ansible
```
2. Edit /etc/ansible/hosts
```
[vm]
111.111.111.111
[vm:vars]
ansible_ssh_user=vagrant
ansible_ssh_pass=vagrant
```
3. Clone pvpc-infra repository
```bash
git clone https://github.com/pleniec/pvpc-infra.git
```
4. Go to pvpc-infra/core directory
```bash
cd pvpc-infra/core
```
5. Start VM
```bash
vagrant up
```
6. Initialize ssh key (remove old if needed)
```bash
ssh 111.111.111.111
```
#### Ansible playbooks
```
+-----------------+            +----------------------+ build.yml+------------------+  start.yml   +--------------+
|                 |            |                      +---------->                  +-------------->              |
|                 |  init.yml  |    Initialized VM    |          |                  |              |              |
| Blank ubuntu VM +------------>  (without pvpc-core) |          |  pvpc-core down  |              | pvpc-core up |
|                 |            |                      |clean.yml |                  |  stop.yml    |              |
|                 |            |                      <----------+                  <--------------+              |
+-----------------+            +----------------------+          +------------------+              +--------------+
```
1. init.yml - installs git, docker and reboots VM
2. build.yml - downloads pvpc-core, builds pvpc-core image and creates Docker containers (postgres, redis, pvpc-core)
3. clean.yml - destroys containers, images and pvpc-core code
4. start.yml - starts containers
5. stop.yml - stops containers
