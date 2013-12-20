whelpjs
=======

Eve-Online live feed of kills and losses of an alliance.

Data provided by raylu/pykill

# Getting started

You will need **node, grunt and bower** at the latest stable version.

```bash
git clone https://github.com/adrien-f/whelpjs.git
cd whelpjs
bower install
npm install 
grunt serve #this will launch the angular app
coffee node_app/main.coffee # launch the node application querying the kills
```   
# TODO

* Add a configuration file to select the alliance and the websocket server
