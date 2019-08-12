ansible-stackstorm
=========

Install stackstorm and pre-requisites

Role Variables
--------------

`deploy_user` is supplied to the Stouts.users role to create the deploy user required by StackStorm.  A default is set in defaults/main.yml

Dependencies
------------

This role depends on the following ansible roles:
```
Stouts.users-master
fairwinds.packer-master
```

You should add these roles to your ansible-requirements.yml 

```
- src: git+ssh://git@github.com/FairwindsOps/ansible-packer
  version: origin/master
  name: fairwinds.packer-master

- src: git+ssh://git@github.com/FairwindsOps/Stouts.users
  version: origin/master
  name: Stouts.users-master

- src: git+ssh://git@github.com/FairwindsOps/ansible-stackstorm
  version: origin/master
  name: fairwinds.stackstorm-master
```

Example Playbook
----------------

```
- name: configure stackstorm instance
  hosts: "tag_Env_{{env}},&tag_Stack_{{stack}},&tag_Layer_{{layer}}"
  user: ubuntu
  gather_facts: false
  roles:
   - fairwinds.stackstorm-master
```

# Notes

* Avoid using characters for passwords that might break the templated configuration files.
