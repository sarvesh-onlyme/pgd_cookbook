PGD Cookbook
=====================
TODO: Enter the cookbook description here.

e.g.
This cookbook makes your favorite breakfast sandwich.

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - pgd_cookbook needs toaster to brown your bagel.

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### pgd_cookbook::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['pgd_cookbook']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Dependent Cookbooks
-----------------
<table>
  <tr>
    <th>Cookbook</th>
    <th>URL</th>
  </tr>
  <tr>
    <td>apache2</td>
    <td>https://github.com/onehealth-cookbooks/apache2</td>
  </tr>
  <tr>
    <td>apt</td>
    <td>https://github.com/opscode-cookbooks/apt</td>
  </tr>
  <tr>
    <td>aws</td>
    <td>https://github.com/opscode-cookbooks/aws</td>
  </tr>
  <tr>
    <td>build-essential</td>
    <td>https://github.com/opscode-cookbooks/build-essential</td>
  </tr>
  <tr>
    <td>chef-sugar</td>
    <td>https://github.com/sethvargo/chef-sugar</td>
  </tr>
  <tr>
    <td>database</td>
    <td>https://github.com/opscode-cookbooks/database</td>
  </tr>
  <tr>
    <td>freebsd</td>
    <td>https://github.com/opscode-cookbooks/freebsd</td>
  </tr>
  <tr>
    <td>git</td>
    <td>https://github.com/jssjr/git</td>
  </tr>
  <tr>
    <td>iptables</td>
    <td>https://github.com/opscode-cookbooks/iptables</td>
  </tr>
  <tr>
    <td>logrotate</td>
    <td>https://github.com/stevendanna/logrotate</td>
  </tr>
  <tr>
    <td>mysql</td>
    <td>https://github.com/opscode-cookbooks/mysql</td>
  </tr>
  <tr>
    <td>mysql-chef_gem</td>
    <td>https://github.com/opscode-cookbooks/mysql-chef_gem</td>
  </tr>
  <tr>
    <td>openssl</td>
    <td>https://github.com/opscode-cookbooks/openssl</td>
  </tr>
  <tr>
    <td>pacman</td>
    <td>https://github.com/jesseadams/pacman</td>
  </tr>
  <tr>
    <td>postgresql</td>
    <td>https://github.com/hw-cookbooks/postgresql</td>
  </tr>
  <tr>
    <td>python</td>
    <td>https://github.com/poise/python</td>
  </tr>
  <tr>
    <td>ubuntu</td>
    <td>https://github.com/opscode-cookbooks/ubuntu</td>
  </tr>
  <tr>
    <td>xfs</td>
    <td>https://github.com/opscode-cookbooks/xfs</td>
  </tr>
  <tr>
    <td>yum</td>
    <td>https://github.com/opscode-cookbooks/yum</td>
  </tr>
  <tr>
    <td>yum-epel</td>
    <td>https://github.com/opscode-cookbooks/yum-epel</td>
  </tr>
  <tr>
    <td>yum-mysql-community</td>
    <td>https://github.com/opscode-cookbooks/yum-mysql-community</td>
  </tr>
</table>


Usage
-----
#### pgd_cookbook::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `pgd_cookbook` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[pgd_cookbook]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors