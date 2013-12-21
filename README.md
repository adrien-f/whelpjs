whelpjs
=======

Eve-Online live feed of kills and losses of an alliance.

Data provided by [raylu/ykill](https://github.com/)

# Getting started

You will need **node, grunt and bower** at the latest stable version.

Edit the ```config.json``` file and fill in your alliance informations.

```bash
git clone https://github.com/adrien-f/whelpjs.git
cd whelpjs
bower install
npm install 
grunt serve # this will launch the angular app
coffee whelpjs_node.coffee # launch the node application querying the kills
```   
# TODO

* Nothing at the moment
