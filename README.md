PGD Cookbook
=====================
This cookbook is for setting up PGD project for easy development.

Requirements
------------
For testing you need the following gems:

- `test-kitchen`
- `kitchen-vagrant`

If you use berkshelf, you also will want to install the `berkshelf` gem as well.

To install dependencies run 'bundle install' in the root of the directory.


Attributes
----------

#### pgd_cookbook::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
   <tr>
    <td><tt>['pgd']['pgd_path']</tt></td>
    <td>String</td>
    <td>Full path to the location PGD gets cloned. Note: This is not where it is installed.</td>
  </tr>
  <tr>
    <td><tt>['pgd']['virtualenv_path']</tt></td>
    <td>String</td>
    <td>Where to actually install PGD to. This is the location setup.sh will create GWM's virtualenv</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['pgd']['user']</tt></td>
    <td>String</td>
    <td>User to change to when running commands</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['pgd']['group']</tt></td>
    <td>String</td>
    <td>Group to change to when running commands</td>
    <td><tt>nil</tt></td>
  </tr>
  <td><tt>['pgd']['debug']</tt></td>
    <td>Boolean</td>
    <td>Whether or not to set the Django debug mode on or off</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['pgd']['static_root']</tt></td>
    <td>String</td>
    <td>Absolute path to where you want staticfiles to be collected to</td>
    <td><tt>/opt/pgd/collected_static</tt></td>
  </tr>
  <tr>
    <td><tt>['pgd']['static_url']</tt></td>
    <td>String</td>
    <td>Url to find GWM's static files at.</td>
    <td><tt>/static</tt></td>
  </tr>
  <tr>
    <td><tt>['pgd']['database']['engine']</tt></td>
    <td>String</td>
    <td>See https://docs.djangoproject.com/en/1.6/ref/settings/#databases</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['pgd']['database']['name']</tt></td>
    <td>String</td>
    <td>See https://docs.djangoproject.com/en/1.6/ref/settings/#databases</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['pgd']['database']['user']</tt></td>
    <td>String</td>
    <td>See https://docs.djangoproject.com/en/1.6/ref/settings/#databases</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['pgd']['database']['password']</tt></td>
    <td>String</td>
    <td>See https://docs.djangoproject.com/en/1.6/ref/settings/#databases</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['pgd']['database']['host']</tt></td>
    <td>String</td>
    <td>See https://docs.djangoproject.com/en/1.6/ref/settings/#databases</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['pgd']['database']['port']</tt></td>
    <td>String</td>
    <td>See https://docs.djangoproject.com/en/1.6/ref/settings/#databases</td>
    <td><tt>nil</tt></td>
  </tr>

</table>

Usage
-----
#### pgd_cookbook::default
Just include `pgd_cookbook` in your node's `run_list`.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[pgd_cookbook]"
  ]
}
```

#### pgd_cookbook::bootstrap_user
Just include `pgd_cookbook::bootstrap_user` in addition to one of the previous
recipes in `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[pgd_cookbook::default]"
    "recipe[pgd_cookbook::bootstrap_user]"
  ]
}
```

Then set the attribute `node['pgd']['superuser']` to something like
this:

````json
{
  "username": "foo",
  "password": "bar",
  "email": "foo@bar.com"
}
````

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
