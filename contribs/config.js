System.config({
  bowerPath: 'libs',
  map: {
    "can": "libs/can/steal/can",
    "jquery/jquery": "jquery"
  },
  paths: {
    "jquery": "libs/jquery/dist/jquery.js",
    "bootstrap":"libs/bootstrap/dist/js/bootstrap.js",
    "bootstrap.css":"libs/bootstrap/dist/css/bootstrap.css",
    "can":"libs/can/steal/can/can.js"
  },
  meta: {
    "jquery": {
        format: "global"
    },
    "bootstrap": {
        "deps":[ "bootstrap.css" ]
    }
  }
});
require("bower.json!bower");
