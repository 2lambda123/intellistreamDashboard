require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"DynamicLoader":[function(require,module,exports){

/*
DynamicLoader Module for FramerJS
https://github.com/LucienLee/framer-DynamicLoader/

Created by Lucien Lee (@luciendeer), Jan. 12th, 2016

DynamicLoader braeks the barriars between 3rd party web development libraries and Framer, which
help you load local, external stylesheets and scripts dynamically.

Add the following line to your project in Framer Studio.
	{DynamicLoader} = require 'DynamicLoader'

[Load one file]
DynamicLoader.add('script.js').then(->
 * when script.js loaded successfully
...
).catch(->
 * when script.js loaded failed
...
)

[Load file in series]
DynamicLoader.series(['one.js', 'two.css', ...]).then( successCallback, failCallback )

[Load file in parallel]
DynamicLoader.series(['one.js', 'two.css', ...]).then( successCallback, failCallback )
 */
exports.DynamicLoader = (function() {
  function DynamicLoader() {}

  DynamicLoader.add = function(url) {
    var promise;
    promise = new Promise(function(resolve, reject) {
      var file, loaded;
      if (url.substr(url.lastIndexOf('.')) === ".js") {
        loaded = Array.prototype.find.call(document.getElementsByTagName('script'), function(element) {
          if (element.getAttribute('src') === url) {
            return element;
          }
        });
        if (loaded !== void 0) {
          return resolve('have loaded');
        }
        file = document.createElement('script');
        file.src = url;
      } else if (url.substr(url.lastIndexOf('.')) === ".css") {
        loaded = Array.prototype.find.call(document.getElementsByTagName('link'), function(element) {
          if (element.getAttribute('rel') === url) {
            return element;
          }
        });
        if (loaded !== void 0) {
          return resolve('have loaded');
        }
        file = document.createElement('link');
        file.rel = "stylesheet";
        file.href = url;
      }
      file.addEventListener('load', function() {
        return resolve(file);
      });
      file.addEventListener('error', function() {
        return reject(file);
      });
      return document.body.appendChild(file);
    });
    return promise;
  };

  DynamicLoader.series = function(urls) {
    if (!Array.isArray(urls) || urls.length === 0) {
      throw "ERROR: NO URL IN ARRAY!";
    }
    return urls.reduce((function(_this) {
      return function(promise, url) {
        return promise.then(function() {
          return _this.add(url);
        });
      };
    })(this), Promise.resolve());
  };

  DynamicLoader.parallel = function(urls) {
    if (!Array.isArray(urls) || urls.length === 0) {
      throw "ERROR: NO URL IN ARRAY!";
    }
    return Promise.all(urls.map((function(_this) {
      return function(url) {
        return _this.add(url);
      };
    })(this)));
  };

  return DynamicLoader;

})();


},{}],"input":[function(require,module,exports){
var _inputStyle, calculatePixelRatio, growthRatio, imageHeight,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

exports.keyboardLayer = new Layer({
  x: 0,
  y: Screen.height,
  width: Screen.width,
  height: 432,
  html: "<img style='width: 100%;' src='modules/keyboard.png'/>"
});

growthRatio = Screen.width / 732;

imageHeight = growthRatio * 432;

_inputStyle = Object.assign({}, Framer.LayerStyle, calculatePixelRatio = function(layer, value) {
  return (value * layer.context.pixelMultiplier) + "px";
}, {
  fontSize: function(layer) {
    return calculatePixelRatio(layer, layer._properties.fontSize);
  },
  lineHeight: function(layer) {
    return layer._properties.lineHeight + "em";
  },
  padding: function(layer) {
    var padding, paddingValue, paddingValues, pixelMultiplier;
    pixelMultiplier = layer.context.pixelMultiplier;
    padding = [];
    paddingValue = layer._properties.padding;
    if (Number.isInteger(paddingValue)) {
      return calculatePixelRatio(layer, paddingValue);
    }
    paddingValues = layer._properties.padding.split(" ");
    switch (paddingValues.length) {
      case 4:
        padding.top = parseFloat(paddingValues[0]);
        padding.right = parseFloat(paddingValues[1]);
        padding.bottom = parseFloat(paddingValues[2]);
        padding.left = parseFloat(paddingValues[3]);
        break;
      case 3:
        padding.top = parseFloat(paddingValues[0]);
        padding.right = parseFloat(paddingValues[1]);
        padding.bottom = parseFloat(paddingValues[2]);
        padding.left = parseFloat(paddingValues[1]);
        break;
      case 2:
        padding.top = parseFloat(paddingValues[0]);
        padding.right = parseFloat(paddingValues[1]);
        padding.bottom = parseFloat(paddingValues[0]);
        padding.left = parseFloat(paddingValues[1]);
        break;
      default:
        padding.top = parseFloat(paddingValues[0]);
        padding.right = parseFloat(paddingValues[0]);
        padding.bottom = parseFloat(paddingValues[0]);
        padding.left = parseFloat(paddingValues[0]);
    }
    return (padding.top * pixelMultiplier) + "px " + (padding.right * pixelMultiplier) + "px " + (padding.bottom * pixelMultiplier) + "px " + (padding.left * pixelMultiplier) + "px";
  }
});

exports.keyboardLayer.states = {
  shown: {
    y: Screen.height - imageHeight
  }
};

exports.keyboardLayer.states.animationOptions = {
  curve: "spring(500,50,15)"
};

exports.Input = (function(superClass) {
  extend(Input, superClass);

  Input.define("style", {
    get: function() {
      return this.input.style;
    },
    set: function(value) {
      return _.extend(this.input.style, value);
    }
  });

  Input.define("value", {
    get: function() {
      return this.input.value;
    },
    set: function(value) {
      return this.input.value = value;
    }
  });

  function Input(options) {
    if (options == null) {
      options = {};
    }
    if (options.setup == null) {
      options.setup = false;
    }
    if (options.width == null) {
      options.width = Screen.width;
    }
    if (options.clip == null) {
      options.clip = false;
    }
    if (options.height == null) {
      options.height = 60;
    }
    if (options.backgroundColor == null) {
      options.backgroundColor = options.setup ? "rgba(255, 60, 47, .5)" : "transparent";
    }
    if (options.fontSize == null) {
      options.fontSize = 30;
    }
    if (options.lineHeight == null) {
      options.lineHeight = 1;
    }
    if (options.padding == null) {
      options.padding = 10;
    }
    if (options.text == null) {
      options.text = "";
    }
    if (options.placeholder == null) {
      options.placeholder = "";
    }
    if (options.virtualKeyboard == null) {
      options.virtualKeyboard = Utils.isMobile() ? false : true;
    }
    if (options.type == null) {
      options.type = "text";
    }
    if (options.goButton == null) {
      options.goButton = false;
    }
    if (options.autoCorrect == null) {
      options.autoCorrect = "on";
    }
    if (options.autoComplete == null) {
      options.autoComplete = "on";
    }
    if (options.autoCapitalize == null) {
      options.autoCapitalize = "on";
    }
    if (options.spellCheck == null) {
      options.spellCheck = "on";
    }
    if (options.autofocus == null) {
      options.autofocus = false;
    }
    if (options.textColor == null) {
      options.textColor = "#000";
    }
    if (options.fontFamily == null) {
      options.fontFamily = "-apple-system";
    }
    if (options.fontWeight == null) {
      options.fontWeight = "500";
    }
    Input.__super__.constructor.call(this, options);
    this._properties.fontSize = options.fontSize;
    this._properties.lineHeight = options.lineHeight;
    this._properties.padding = options.padding;
    if (options.placeholderColor != null) {
      this.placeholderColor = options.placeholderColor;
    }
    this.input = document.createElement("input");
    this.input.id = "input-" + (_.now());
    this.input.style.width = _inputStyle["width"](this);
    this.input.style.height = _inputStyle["height"](this);
    this.input.style.fontSize = _inputStyle["fontSize"](this);
    this.input.style.lineHeight = _inputStyle["lineHeight"](this);
    this.input.style.outline = "none";
    this.input.style.border = "none";
    this.input.style.backgroundColor = options.backgroundColor;
    this.input.style.padding = _inputStyle["padding"](this);
    this.input.style.fontFamily = options.fontFamily;
    this.input.style.color = options.textColor;
    this.input.style.fontWeight = options.fontWeight;
    this.input.value = options.text;
    this.input.type = options.type;
    this.input.placeholder = options.placeholder;
    this.input.setAttribute("autocorrect", options.autoCorrect);
    this.input.setAttribute("autocomplete", options.autoComplete);
    this.input.setAttribute("autocapitalize", options.autoCapitalize);
    if (options.autofocus === true) {
      this.input.setAttribute("autofocus", true);
    }
    this.input.setAttribute("spellcheck", options.spellCheck);
    this.form = document.createElement("form");
    if (options.goButton) {
      this.form.action = "#";
      this.form.addEventListener("submit", function(event) {
        return event.preventDefault();
      });
    }
    this.form.appendChild(this.input);
    this._element.appendChild(this.form);
    this.backgroundColor = "transparent";
    if (this.placeholderColor) {
      this.updatePlaceholderColor(options.placeholderColor);
    }
    if (!Utils.isMobile() && options.virtualKeyboard === true) {
      this.input.addEventListener("focus", function() {
        exports.keyboardLayer.bringToFront();
        return exports.keyboardLayer.stateCycle();
      });
      this.input.addEventListener("blur", function() {
        return exports.keyboardLayer.animate("default");
      });
    }
  }

  Input.prototype.updatePlaceholderColor = function(color) {
    var css;
    this.placeholderColor = color;
    if (this.pageStyle != null) {
      document.head.removeChild(this.pageStyle);
    }
    this.pageStyle = document.createElement("style");
    this.pageStyle.type = "text/css";
    css = "#" + this.input.id + "::-webkit-input-placeholder { color: " + this.placeholderColor + "; }";
    this.pageStyle.appendChild(document.createTextNode(css));
    return document.head.appendChild(this.pageStyle);
  };

  Input.prototype.focus = function() {
    return this.input.focus();
  };

  Input.prototype.onFocus = function(cb) {
    return this.input.addEventListener("focus", function() {
      return cb.apply(this);
    });
  };

  Input.prototype.onBlur = function(cb) {
    return this.input.addEventListener("blur", function() {
      return cb.apply(this);
    });
  };

  return Input;

})(Layer);


},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}],"productionData":[function(require,module,exports){
exports.data = [
  {
    "data": [300, 500, 650, 450, 575, 450, 375, 300, 500, 650, 450, 675, 800, 650, 400, 500, 650, 450, 675, 750, 550, 370, 475, 650, 450, 675, 550, 450, 350, 275],
    "unit": "cu.ft/dl",
    "type": "Gas"
  }, {
    "data": [350, 550, 620, 480, 550, 480, 400, 350, 450, 610, 480, 650, 750, 670, 480, 470, 610, 480, 615, 710, 580, 400, 510, 610, 410, 650, 580, 410, 370, 320],
    "unit": "cu.ft/dl",
    "type": "Gas"
  }, {
    "data": [3500, 4500, 6250, 5700, 4750, 8000, 6000, 4000, 5500, 6500, 6000, 4000, 8250, 6750, 5000, 5500, 6000, 4000, 5500, 7500, 5150, 6000, 4250, 5750, 8000, 7100, 6000, 4000, 5000, 6000],
    "unit": "bbl/d",
    "type": "Oil"
  }, {
    "data": [3000, 4400, 6000, 5100, 4750, 7000, 6000, 4500, 5100, 6100, 5000, 4500, 7750, 6350, 5200, 5900, 6300, 4700, 5200, 7000, 5750, 6300, 4750, 6100, 7000, 7500, 6500, 5000, 5500, 5500],
    "unit": "bbl/d",
    "type": "Oil"
  }, {
    "data": [7500, 6500, 5250, 4700, 2750, 3000, 5000, 6600, 7500, 6100, 5200, 4000, 6250, 7750, 5600, 4500, 3000, 4000, 5500, 6500, 7150, 8200, 6750, 5750, 3000, 4700, 6000, 7800, 5000, 3300],
    "unit": "bbl/d",
    "type": "Water"
  }, {
    "data": [7000, 6100, 5550, 5100, 3250, 3600, 4700, 6100, 7100, 6500, 5600, 4500, 5750, 7150, 6000, 4800, 3600, 4500, 5900, 6900, 7050, 7750, 7000, 6000, 3900, 4900, 6300, 7000, 6000, 4000],
    "unit": "bbl/d",
    "type": "Water"
  }
];


},{}],"timeseriesData":[function(require,module,exports){
exports.data = [
  {
    "data": [33425, 26552, 34041, 25844, 31401, 33571, 27369, 28394, 25473, 32902, 28764, 30433, 27415, 29135, 26118, 32326, 29127, 28896, 32221, 27131, 34313, 26888, 34393, 26961, 29073, 29505, 32791, 31568, 26608, 25354, 30842, 30174, 29331, 26032, 30087, 27330, 31008, 33720, 33357, 29530, 31338, 32655, 33645, 25550, 34575, 25771, 34547, 34726, 30266, 33460, 25969, 27851, 27868, 30675, 26883, 29957, 27726, 27569, 29138, 28290, 26877, 31148, 32282, 32394, 29866, 34591, 26771, 30848, 25085, 27368, 29877, 27596, 29727, 34735, 29620, 31390, 28757, 27717, 28046, 26245, 29459, 34225, 26359, 25291, 26631, 31254, 31216, 33848, 28494, 33285, 25889, 28227, 25849, 27124, 30764, 28751, 28574, 31346, 26430, 31054],
    "unit": "bbl/d",
    "type": "Oil"
  }, {
    "data": [42587, 48324, 41729, 42301, 31295, 41138, 36059, 38589, 36507, 32482, 40699, 34362, 47459, 43069, 49296, 36726, 46668, 33550, 38420, 34183, 34835, 40442, 42310, 31348, 45453, 39357, 37783, 41185, 33808, 42268, 34511, 46133, 42554, 43680, 42884, 33647, 34227, 49183, 40642, 46019, 35385, 33851, 36042, 49626, 39066, 43296, 46977, 35850, 40683, 35309, 41073, 34932, 35094, 34935, 37345, 41600, 30693, 30691, 36782, 40669, 40964, 35394, 49807, 39397, 37445, 45113, 35222, 37646, 34559, 36762, 43178, 46855, 36817, 39451, 31192, 42054, 35046, 31604, 38791, 34485, 45939, 40117, 47111, 44030, 34071, 42881, 41814, 49567, 41132, 32784, 43268, 38066, 31601, 48416, 32240, 35095, 41379, 45549, 43762, 44430],
    "unit": "cu.ft/dl",
    "type": "Water"
  }, {
    "data": [76769, 83514, 83588, 81602, 87607, 72630, 72376, 75964, 73537, 70142, 78656, 83164, 85557, 84471, 82919, 82467, 84566, 71442, 71097, 89310, 88078, 82608, 78838, 78003, 79131, 87768, 77026, 87078, 75422, 73787, 85169, 87163, 89962, 87149, 77659, 71150, 78972, 73404, 72764, 77289, 84119, 77678, 80097, 81337, 85151, 87428, 73420, 74468, 71555, 70066, 80163, 79189, 86508, 71328, 71489, 88588, 77397, 88512, 72692, 81338, 74807, 83099, 80105, 75325, 77245, 84810, 76152, 72237, 89349, 77216, 79500, 88306, 84033, 82026, 71326, 74629, 81405, 74076, 72216, 75727, 89926, 81812, 87511, 89468, 71160, 81210, 71210, 77386, 73474, 88000, 74451, 70704, 84475, 83244, 70792, 78009, 73824, 82179, 71615, 87948],
    "unit": "cu.ft/dl",
    "type": "Gas"
  }
];


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL2VkbW9udGVycnViaW8vZ2l0aHViL2ludGVsbGlzdHJlYW0vaW50ZWxsaXN0cmVhbS1kYXNoYm9hcmQuZnJhbWVyL21vZHVsZXMvdGltZXNlcmllc0RhdGEuY29mZmVlIiwiLi4vLi4vLi4vLi4vLi4vVXNlcnMvZWRtb250ZXJydWJpby9naXRodWIvaW50ZWxsaXN0cmVhbS9pbnRlbGxpc3RyZWFtLWRhc2hib2FyZC5mcmFtZXIvbW9kdWxlcy9wcm9kdWN0aW9uRGF0YS5jb2ZmZWUiLCIuLi8uLi8uLi8uLi8uLi9Vc2Vycy9lZG1vbnRlcnJ1YmlvL2dpdGh1Yi9pbnRlbGxpc3RyZWFtL2ludGVsbGlzdHJlYW0tZGFzaGJvYXJkLmZyYW1lci9tb2R1bGVzL215TW9kdWxlLmNvZmZlZSIsIi4uLy4uLy4uLy4uLy4uL1VzZXJzL2VkbW9udGVycnViaW8vZ2l0aHViL2ludGVsbGlzdHJlYW0vaW50ZWxsaXN0cmVhbS1kYXNoYm9hcmQuZnJhbWVyL21vZHVsZXMvaW5wdXQuY29mZmVlIiwiLi4vLi4vLi4vLi4vLi4vVXNlcnMvZWRtb250ZXJydWJpby9naXRodWIvaW50ZWxsaXN0cmVhbS9pbnRlbGxpc3RyZWFtLWRhc2hib2FyZC5mcmFtZXIvbW9kdWxlcy9EeW5hbWljTG9hZGVyLmNvZmZlZSIsIm5vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiXSwic291cmNlc0NvbnRlbnQiOlsiZXhwb3J0cy5kYXRhID0gW1xuICAgIHtcbiAgICAgICAgXCJkYXRhXCI6IFszMzQyNSwyNjU1MiwzNDA0MSwyNTg0NCwzMTQwMSwzMzU3MSwyNzM2OSwyODM5NCwyNTQ3MywzMjkwMiwyODc2NCwzMDQzMywyNzQxNSwyOTEzNSwyNjExOCwzMjMyNiwyOTEyNywyODg5NiwzMjIyMSwyNzEzMSwzNDMxMywyNjg4OCwzNDM5MywyNjk2MSwyOTA3MywyOTUwNSwzMjc5MSwzMTU2OCwyNjYwOCwyNTM1NCwzMDg0MiwzMDE3NCwyOTMzMSwyNjAzMiwzMDA4NywyNzMzMCwzMTAwOCwzMzcyMCwzMzM1NywyOTUzMCwzMTMzOCwzMjY1NSwzMzY0NSwyNTU1MCwzNDU3NSwyNTc3MSwzNDU0NywzNDcyNiwzMDI2NiwzMzQ2MCwyNTk2OSwyNzg1MSwyNzg2OCwzMDY3NSwyNjg4MywyOTk1NywyNzcyNiwyNzU2OSwyOTEzOCwyODI5MCwyNjg3NywzMTE0OCwzMjI4MiwzMjM5NCwyOTg2NiwzNDU5MSwyNjc3MSwzMDg0OCwyNTA4NSwyNzM2OCwyOTg3NywyNzU5NiwyOTcyNywzNDczNSwyOTYyMCwzMTM5MCwyODc1NywyNzcxNywyODA0NiwyNjI0NSwyOTQ1OSwzNDIyNSwyNjM1OSwyNTI5MSwyNjYzMSwzMTI1NCwzMTIxNiwzMzg0OCwyODQ5NCwzMzI4NSwyNTg4OSwyODIyNywyNTg0OSwyNzEyNCwzMDc2NCwyODc1MSwyODU3NCwzMTM0NiwyNjQzMCwzMTA1NF0sXG4gICAgICAgIFwidW5pdFwiOiBcImJibC9kXCIsXG4gICAgICAgIFwidHlwZVwiOiBcIk9pbFwiXG4gICAgfSxcbiAgICB7XG4gICAgICAgIFwiZGF0YVwiOiBbNDI1ODcsNDgzMjQsNDE3MjksNDIzMDEsMzEyOTUsNDExMzgsMzYwNTksMzg1ODksMzY1MDcsMzI0ODIsNDA2OTksMzQzNjIsNDc0NTksNDMwNjksNDkyOTYsMzY3MjYsNDY2NjgsMzM1NTAsMzg0MjAsMzQxODMsMzQ4MzUsNDA0NDIsNDIzMTAsMzEzNDgsNDU0NTMsMzkzNTcsMzc3ODMsNDExODUsMzM4MDgsNDIyNjgsMzQ1MTEsNDYxMzMsNDI1NTQsNDM2ODAsNDI4ODQsMzM2NDcsMzQyMjcsNDkxODMsNDA2NDIsNDYwMTksMzUzODUsMzM4NTEsMzYwNDIsNDk2MjYsMzkwNjYsNDMyOTYsNDY5NzcsMzU4NTAsNDA2ODMsMzUzMDksNDEwNzMsMzQ5MzIsMzUwOTQsMzQ5MzUsMzczNDUsNDE2MDAsMzA2OTMsMzA2OTEsMzY3ODIsNDA2NjksNDA5NjQsMzUzOTQsNDk4MDcsMzkzOTcsMzc0NDUsNDUxMTMsMzUyMjIsMzc2NDYsMzQ1NTksMzY3NjIsNDMxNzgsNDY4NTUsMzY4MTcsMzk0NTEsMzExOTIsNDIwNTQsMzUwNDYsMzE2MDQsMzg3OTEsMzQ0ODUsNDU5MzksNDAxMTcsNDcxMTEsNDQwMzAsMzQwNzEsNDI4ODEsNDE4MTQsNDk1NjcsNDExMzIsMzI3ODQsNDMyNjgsMzgwNjYsMzE2MDEsNDg0MTYsMzIyNDAsMzUwOTUsNDEzNzksNDU1NDksNDM3NjIsNDQ0MzBdLFxuICAgICAgICBcInVuaXRcIjogXCJjdS5mdC9kbFwiLFxuICAgICAgICBcInR5cGVcIjogXCJXYXRlclwiXG4gICAgfSxcbiAgICB7XG4gICAgICAgIFwiZGF0YVwiOiBbNzY3NjksODM1MTQsODM1ODgsODE2MDIsODc2MDcsNzI2MzAsNzIzNzYsNzU5NjQsNzM1MzcsNzAxNDIsNzg2NTYsODMxNjQsODU1NTcsODQ0NzEsODI5MTksODI0NjcsODQ1NjYsNzE0NDIsNzEwOTcsODkzMTAsODgwNzgsODI2MDgsNzg4MzgsNzgwMDMsNzkxMzEsODc3NjgsNzcwMjYsODcwNzgsNzU0MjIsNzM3ODcsODUxNjksODcxNjMsODk5NjIsODcxNDksNzc2NTksNzExNTAsNzg5NzIsNzM0MDQsNzI3NjQsNzcyODksODQxMTksNzc2NzgsODAwOTcsODEzMzcsODUxNTEsODc0MjgsNzM0MjAsNzQ0NjgsNzE1NTUsNzAwNjYsODAxNjMsNzkxODksODY1MDgsNzEzMjgsNzE0ODksODg1ODgsNzczOTcsODg1MTIsNzI2OTIsODEzMzgsNzQ4MDcsODMwOTksODAxMDUsNzUzMjUsNzcyNDUsODQ4MTAsNzYxNTIsNzIyMzcsODkzNDksNzcyMTYsNzk1MDAsODgzMDYsODQwMzMsODIwMjYsNzEzMjYsNzQ2MjksODE0MDUsNzQwNzYsNzIyMTYsNzU3MjcsODk5MjYsODE4MTIsODc1MTEsODk0NjgsNzExNjAsODEyMTAsNzEyMTAsNzczODYsNzM0NzQsODgwMDAsNzQ0NTEsNzA3MDQsODQ0NzUsODMyNDQsNzA3OTIsNzgwMDksNzM4MjQsODIxNzksNzE2MTUsODc5NDhdLFxuICAgICAgICBcInVuaXRcIjogXCJjdS5mdC9kbFwiLFxuICAgICAgICBcInR5cGVcIjogXCJHYXNcIlxuICAgIH1cbl1cbiIsImV4cG9ydHMuZGF0YSA9IFtcbiAgICB7XG4gICAgICAgIFwiZGF0YVwiOiBbMzAwLDUwMCw2NTAsNDUwLDU3NSw0NTAsMzc1LDMwMCw1MDAsNjUwLDQ1MCw2NzUsODAwLDY1MCw0MDAsNTAwLDY1MCw0NTAsNjc1LDc1MCw1NTAsMzcwLDQ3NSw2NTAsNDUwLDY3NSw1NTAsNDUwLDM1MCwyNzVdLFxuICAgICAgICBcInVuaXRcIjogXCJjdS5mdC9kbFwiLFxuICAgICAgICBcInR5cGVcIjogXCJHYXNcIixcbiAgICB9LFxuICAgIHtcbiAgICAgICAgXCJkYXRhXCI6IFszNTAsNTUwLDYyMCw0ODAsNTUwLDQ4MCw0MDAsMzUwLDQ1MCw2MTAsNDgwLDY1MCw3NTAsNjcwLDQ4MCw0NzAsNjEwLDQ4MCw2MTUsNzEwLDU4MCw0MDAsNTEwLDYxMCw0MTAsNjUwLDU4MCw0MTAsMzcwLDMyMF0sXG4gICAgICAgIFwidW5pdFwiOiBcImN1LmZ0L2RsXCIsXG4gICAgICAgIFwidHlwZVwiOiBcIkdhc1wiLFxuICAgIH0sXG4gICAge1xuICAgICAgICBcImRhdGFcIjogWzM1MDAsNDUwMCw2MjUwLDU3MDAsNDc1MCw4MDAwLDYwMDAsNDAwMCw1NTAwLDY1MDAsNjAwMCw0MDAwLDgyNTAsNjc1MCw1MDAwLDU1MDAsNjAwMCw0MDAwLDU1MDAsNzUwMCw1MTUwLDYwMDAsNDI1MCw1NzUwLDgwMDAsNzEwMCw2MDAwLDQwMDAsNTAwMCw2MDAwXSxcbiAgICAgICAgXCJ1bml0XCI6IFwiYmJsL2RcIixcbiAgICAgICAgXCJ0eXBlXCI6IFwiT2lsXCIsXG4gICAgfSxcbiAgICB7XG4gICAgICAgIFwiZGF0YVwiOiBbMzAwMCw0NDAwLDYwMDAsNTEwMCw0NzUwLDcwMDAsNjAwMCw0NTAwLDUxMDAsNjEwMCw1MDAwLDQ1MDAsNzc1MCw2MzUwLDUyMDAsNTkwMCw2MzAwLDQ3MDAsNTIwMCw3MDAwLDU3NTAsNjMwMCw0NzUwLDYxMDAsNzAwMCw3NTAwLDY1MDAsNTAwMCw1NTAwLDU1MDBdLFxuICAgICAgICBcInVuaXRcIjogXCJiYmwvZFwiLFxuICAgICAgICBcInR5cGVcIjogXCJPaWxcIixcbiAgICB9LFxuICAgIHtcbiAgICAgICAgXCJkYXRhXCI6IFs3NTAwLDY1MDAsNTI1MCw0NzAwLDI3NTAsMzAwMCw1MDAwLDY2MDAsNzUwMCw2MTAwLDUyMDAsNDAwMCw2MjUwLDc3NTAsNTYwMCw0NTAwLDMwMDAsNDAwMCw1NTAwLDY1MDAsNzE1MCw4MjAwLDY3NTAsNTc1MCwzMDAwLDQ3MDAsNjAwMCw3ODAwLDUwMDAsMzMwMF0sXG4gICAgICAgIFwidW5pdFwiOiBcImJibC9kXCIsXG4gICAgICAgIFwidHlwZVwiOiBcIldhdGVyXCIsXG4gICAgfSxcbiAgICB7XG4gICAgICAgIFwiZGF0YVwiOiBbNzAwMCw2MTAwLDU1NTAsNTEwMCwzMjUwLDM2MDAsNDcwMCw2MTAwLDcxMDAsNjUwMCw1NjAwLDQ1MDAsNTc1MCw3MTUwLDYwMDAsNDgwMCwzNjAwLDQ1MDAsNTkwMCw2OTAwLDcwNTAsNzc1MCw3MDAwLDYwMDAsMzkwMCw0OTAwLDYzMDAsNzAwMCw2MDAwLDQwMDBdLFxuICAgICAgICBcInVuaXRcIjogXCJiYmwvZFwiLFxuICAgICAgICBcInR5cGVcIjogXCJXYXRlclwiLFxuICAgIH1cbl1cbiIsIiMgQWRkIHRoZSBmb2xsb3dpbmcgbGluZSB0byB5b3VyIHByb2plY3QgaW4gRnJhbWVyIFN0dWRpby4gXG4jIG15TW9kdWxlID0gcmVxdWlyZSBcIm15TW9kdWxlXCJcbiMgUmVmZXJlbmNlIHRoZSBjb250ZW50cyBieSBuYW1lLCBsaWtlIG15TW9kdWxlLm15RnVuY3Rpb24oKSBvciBteU1vZHVsZS5teVZhclxuXG5leHBvcnRzLm15VmFyID0gXCJteVZhcmlhYmxlXCJcblxuZXhwb3J0cy5teUZ1bmN0aW9uID0gLT5cblx0cHJpbnQgXCJteUZ1bmN0aW9uIGlzIHJ1bm5pbmdcIlxuXG5leHBvcnRzLm15QXJyYXkgPSBbMSwgMiwgM10iLCJleHBvcnRzLmtleWJvYXJkTGF5ZXIgPSBuZXcgTGF5ZXJcblx0eDowLCB5OlNjcmVlbi5oZWlnaHQsIHdpZHRoOlNjcmVlbi53aWR0aCwgaGVpZ2h0OjQzMlxuXHRodG1sOlwiPGltZyBzdHlsZT0nd2lkdGg6IDEwMCU7JyBzcmM9J21vZHVsZXMva2V5Ym9hcmQucG5nJy8+XCJcblxuI3NjcmVlbiB3aWR0aCB2cy4gc2l6ZSBvZiBpbWFnZSB3aWR0aFxuZ3Jvd3RoUmF0aW8gPSBTY3JlZW4ud2lkdGggLyA3MzJcbmltYWdlSGVpZ2h0ID0gZ3Jvd3RoUmF0aW8gKiA0MzJcblxuIyBFeHRlbmRzIHRoZSBMYXllclN0eWxlIGNsYXNzIHdoaWNoIGRvZXMgdGhlIHBpeGVsIHJhdGlvIGNhbGN1bGF0aW9ucyBpbiBmcmFtZXJcbl9pbnB1dFN0eWxlID1cblx0T2JqZWN0LmFzc2lnbih7fSwgRnJhbWVyLkxheWVyU3R5bGUsXG5cdFx0Y2FsY3VsYXRlUGl4ZWxSYXRpbyA9IChsYXllciwgdmFsdWUpIC0+XG5cdFx0XHQodmFsdWUgKiBsYXllci5jb250ZXh0LnBpeGVsTXVsdGlwbGllcikgKyBcInB4XCJcblxuXHRcdGZvbnRTaXplOiAobGF5ZXIpIC0+XG5cdFx0XHRjYWxjdWxhdGVQaXhlbFJhdGlvKGxheWVyLCBsYXllci5fcHJvcGVydGllcy5mb250U2l6ZSlcblxuXHRcdGxpbmVIZWlnaHQ6IChsYXllcikgLT5cblx0XHRcdChsYXllci5fcHJvcGVydGllcy5saW5lSGVpZ2h0KSArIFwiZW1cIlxuXG5cdFx0cGFkZGluZzogKGxheWVyKSAtPlxuXHRcdFx0eyBwaXhlbE11bHRpcGxpZXIgfSA9IGxheWVyLmNvbnRleHRcblx0XHRcdHBhZGRpbmcgPSBbXVxuXHRcdFx0cGFkZGluZ1ZhbHVlID0gbGF5ZXIuX3Byb3BlcnRpZXMucGFkZGluZ1xuXG5cdFx0XHQjIENoZWNrIGlmIHdlIGhhdmUgYSBzaW5nbGUgbnVtYmVyIGFzIGludGVnZXJcblx0XHRcdGlmIE51bWJlci5pc0ludGVnZXIocGFkZGluZ1ZhbHVlKVxuXHRcdFx0XHRyZXR1cm4gY2FsY3VsYXRlUGl4ZWxSYXRpbyhsYXllciwgcGFkZGluZ1ZhbHVlKVxuXG5cdFx0XHQjIElmIHdlIGhhdmUgbXVsdGlwbGUgdmFsdWVzIHRoZXkgY29tZSBhcyBzdHJpbmcgKGUuZy4gXCIxIDIgMyA0XCIpXG5cdFx0XHRwYWRkaW5nVmFsdWVzID0gbGF5ZXIuX3Byb3BlcnRpZXMucGFkZGluZy5zcGxpdChcIiBcIilcblxuXHRcdFx0c3dpdGNoIHBhZGRpbmdWYWx1ZXMubGVuZ3RoXG5cdFx0XHRcdHdoZW4gNFxuXHRcdFx0XHRcdHBhZGRpbmcudG9wID0gcGFyc2VGbG9hdChwYWRkaW5nVmFsdWVzWzBdKVxuXHRcdFx0XHRcdHBhZGRpbmcucmlnaHQgPSBwYXJzZUZsb2F0KHBhZGRpbmdWYWx1ZXNbMV0pXG5cdFx0XHRcdFx0cGFkZGluZy5ib3R0b20gPSBwYXJzZUZsb2F0KHBhZGRpbmdWYWx1ZXNbMl0pXG5cdFx0XHRcdFx0cGFkZGluZy5sZWZ0ID0gcGFyc2VGbG9hdChwYWRkaW5nVmFsdWVzWzNdKVxuXG5cdFx0XHRcdHdoZW4gM1xuXHRcdFx0XHRcdHBhZGRpbmcudG9wID0gcGFyc2VGbG9hdChwYWRkaW5nVmFsdWVzWzBdKVxuXHRcdFx0XHRcdHBhZGRpbmcucmlnaHQgPSBwYXJzZUZsb2F0KHBhZGRpbmdWYWx1ZXNbMV0pXG5cdFx0XHRcdFx0cGFkZGluZy5ib3R0b20gPSBwYXJzZUZsb2F0KHBhZGRpbmdWYWx1ZXNbMl0pXG5cdFx0XHRcdFx0cGFkZGluZy5sZWZ0ID0gcGFyc2VGbG9hdChwYWRkaW5nVmFsdWVzWzFdKVxuXG5cdFx0XHRcdHdoZW4gMlxuXHRcdFx0XHRcdHBhZGRpbmcudG9wID0gcGFyc2VGbG9hdChwYWRkaW5nVmFsdWVzWzBdKVxuXHRcdFx0XHRcdHBhZGRpbmcucmlnaHQgPSBwYXJzZUZsb2F0KHBhZGRpbmdWYWx1ZXNbMV0pXG5cdFx0XHRcdFx0cGFkZGluZy5ib3R0b20gPSBwYXJzZUZsb2F0KHBhZGRpbmdWYWx1ZXNbMF0pXG5cdFx0XHRcdFx0cGFkZGluZy5sZWZ0ID0gcGFyc2VGbG9hdChwYWRkaW5nVmFsdWVzWzFdKVxuXG5cdFx0XHRcdGVsc2Vcblx0XHRcdFx0XHRwYWRkaW5nLnRvcCA9IHBhcnNlRmxvYXQocGFkZGluZ1ZhbHVlc1swXSlcblx0XHRcdFx0XHRwYWRkaW5nLnJpZ2h0ID0gcGFyc2VGbG9hdChwYWRkaW5nVmFsdWVzWzBdKVxuXHRcdFx0XHRcdHBhZGRpbmcuYm90dG9tID0gcGFyc2VGbG9hdChwYWRkaW5nVmFsdWVzWzBdKVxuXHRcdFx0XHRcdHBhZGRpbmcubGVmdCA9IHBhcnNlRmxvYXQocGFkZGluZ1ZhbHVlc1swXSlcblxuXHRcdFx0IyBSZXR1cm4gYXMgNC12YWx1ZSBzdHJpbmcgKGUuZyBcIjFweCAycHggM3B4IDRweFwiKVxuXHRcdFx0XCIje3BhZGRpbmcudG9wICogcGl4ZWxNdWx0aXBsaWVyfXB4ICN7cGFkZGluZy5yaWdodCAqIHBpeGVsTXVsdGlwbGllcn1weCAje3BhZGRpbmcuYm90dG9tICogcGl4ZWxNdWx0aXBsaWVyfXB4ICN7cGFkZGluZy5sZWZ0ICogcGl4ZWxNdWx0aXBsaWVyfXB4XCJcblx0KVxuXG5leHBvcnRzLmtleWJvYXJkTGF5ZXIuc3RhdGVzID1cblx0c2hvd246XG5cdFx0eTogU2NyZWVuLmhlaWdodCAtIGltYWdlSGVpZ2h0XG5cbmV4cG9ydHMua2V5Ym9hcmRMYXllci5zdGF0ZXMuYW5pbWF0aW9uT3B0aW9ucyA9XG5cdGN1cnZlOiBcInNwcmluZyg1MDAsNTAsMTUpXCJcblxuY2xhc3MgZXhwb3J0cy5JbnB1dCBleHRlbmRzIExheWVyXG5cdEBkZWZpbmUgXCJzdHlsZVwiLFxuXHRcdGdldDogLT4gQGlucHV0LnN0eWxlXG5cdFx0c2V0OiAodmFsdWUpIC0+XG5cdFx0XHRfLmV4dGVuZCBAaW5wdXQuc3R5bGUsIHZhbHVlXG5cblx0QGRlZmluZSBcInZhbHVlXCIsXG5cdFx0Z2V0OiAtPiBAaW5wdXQudmFsdWVcblx0XHRzZXQ6ICh2YWx1ZSkgLT5cblx0XHRcdEBpbnB1dC52YWx1ZSA9IHZhbHVlXG5cblx0Y29uc3RydWN0b3I6IChvcHRpb25zID0ge30pIC0+XG5cdFx0b3B0aW9ucy5zZXR1cCA/PSBmYWxzZVxuXHRcdG9wdGlvbnMud2lkdGggPz0gU2NyZWVuLndpZHRoXG5cdFx0b3B0aW9ucy5jbGlwID89IGZhbHNlXG5cdFx0b3B0aW9ucy5oZWlnaHQgPz0gNjBcblx0XHRvcHRpb25zLmJhY2tncm91bmRDb2xvciA/PSBpZiBvcHRpb25zLnNldHVwIHRoZW4gXCJyZ2JhKDI1NSwgNjAsIDQ3LCAuNSlcIiBlbHNlIFwidHJhbnNwYXJlbnRcIlxuXHRcdG9wdGlvbnMuZm9udFNpemUgPz0gMzBcblx0XHRvcHRpb25zLmxpbmVIZWlnaHQgPz0gMVxuXHRcdG9wdGlvbnMucGFkZGluZyA/PSAxMFxuXHRcdG9wdGlvbnMudGV4dCA/PSBcIlwiXG5cdFx0b3B0aW9ucy5wbGFjZWhvbGRlciA/PSBcIlwiXG5cdFx0b3B0aW9ucy52aXJ0dWFsS2V5Ym9hcmQgPz0gaWYgVXRpbHMuaXNNb2JpbGUoKSB0aGVuIGZhbHNlIGVsc2UgdHJ1ZVxuXHRcdG9wdGlvbnMudHlwZSA/PSBcInRleHRcIlxuXHRcdG9wdGlvbnMuZ29CdXR0b24gPz0gZmFsc2Vcblx0XHRvcHRpb25zLmF1dG9Db3JyZWN0ID89IFwib25cIlxuXHRcdG9wdGlvbnMuYXV0b0NvbXBsZXRlID89IFwib25cIlxuXHRcdG9wdGlvbnMuYXV0b0NhcGl0YWxpemUgPz0gXCJvblwiXG5cdFx0b3B0aW9ucy5zcGVsbENoZWNrID89IFwib25cIlxuXHRcdG9wdGlvbnMuYXV0b2ZvY3VzID89IGZhbHNlXG5cdFx0b3B0aW9ucy50ZXh0Q29sb3IgPz0gXCIjMDAwXCJcblx0XHRvcHRpb25zLmZvbnRGYW1pbHkgPz0gXCItYXBwbGUtc3lzdGVtXCJcblx0XHRvcHRpb25zLmZvbnRXZWlnaHQgPz0gXCI1MDBcIlxuXG5cdFx0c3VwZXIgb3B0aW9uc1xuXG5cdFx0IyBBZGQgYWRkaXRpb25hbCBwcm9wZXJ0aWVzXG5cdFx0QF9wcm9wZXJ0aWVzLmZvbnRTaXplID0gb3B0aW9ucy5mb250U2l6ZVxuXHRcdEBfcHJvcGVydGllcy5saW5lSGVpZ2h0ID0gb3B0aW9ucy5saW5lSGVpZ2h0XG5cdFx0QF9wcm9wZXJ0aWVzLnBhZGRpbmcgPSBvcHRpb25zLnBhZGRpbmdcblxuXHRcdEBwbGFjZWhvbGRlckNvbG9yID0gb3B0aW9ucy5wbGFjZWhvbGRlckNvbG9yIGlmIG9wdGlvbnMucGxhY2Vob2xkZXJDb2xvcj9cblx0XHRAaW5wdXQgPSBkb2N1bWVudC5jcmVhdGVFbGVtZW50IFwiaW5wdXRcIlxuXHRcdEBpbnB1dC5pZCA9IFwiaW5wdXQtI3tfLm5vdygpfVwiXG5cblx0XHQjIEFkZCBzdHlsaW5nIHRvIHRoZSBpbnB1dCBlbGVtZW50XG5cdFx0QGlucHV0LnN0eWxlLndpZHRoID0gX2lucHV0U3R5bGVbXCJ3aWR0aFwiXShAKVxuXHRcdEBpbnB1dC5zdHlsZS5oZWlnaHQgPSBfaW5wdXRTdHlsZVtcImhlaWdodFwiXShAKVxuXHRcdEBpbnB1dC5zdHlsZS5mb250U2l6ZSA9IF9pbnB1dFN0eWxlW1wiZm9udFNpemVcIl0oQClcblx0XHRAaW5wdXQuc3R5bGUubGluZUhlaWdodCA9IF9pbnB1dFN0eWxlW1wibGluZUhlaWdodFwiXShAKVxuXHRcdEBpbnB1dC5zdHlsZS5vdXRsaW5lID0gXCJub25lXCJcblx0XHRAaW5wdXQuc3R5bGUuYm9yZGVyID0gXCJub25lXCJcblx0XHRAaW5wdXQuc3R5bGUuYmFja2dyb3VuZENvbG9yID0gb3B0aW9ucy5iYWNrZ3JvdW5kQ29sb3Jcblx0XHRAaW5wdXQuc3R5bGUucGFkZGluZyA9IF9pbnB1dFN0eWxlW1wicGFkZGluZ1wiXShAKVxuXHRcdEBpbnB1dC5zdHlsZS5mb250RmFtaWx5ID0gb3B0aW9ucy5mb250RmFtaWx5XG5cdFx0QGlucHV0LnN0eWxlLmNvbG9yID0gb3B0aW9ucy50ZXh0Q29sb3Jcblx0XHRAaW5wdXQuc3R5bGUuZm9udFdlaWdodCA9IG9wdGlvbnMuZm9udFdlaWdodFxuXG5cdFx0QGlucHV0LnZhbHVlID0gb3B0aW9ucy50ZXh0XG5cdFx0QGlucHV0LnR5cGUgPSBvcHRpb25zLnR5cGVcblx0XHRAaW5wdXQucGxhY2Vob2xkZXIgPSBvcHRpb25zLnBsYWNlaG9sZGVyXG5cdFx0QGlucHV0LnNldEF0dHJpYnV0ZSBcImF1dG9jb3JyZWN0XCIsIG9wdGlvbnMuYXV0b0NvcnJlY3Rcblx0XHRAaW5wdXQuc2V0QXR0cmlidXRlIFwiYXV0b2NvbXBsZXRlXCIsIG9wdGlvbnMuYXV0b0NvbXBsZXRlXG5cdFx0QGlucHV0LnNldEF0dHJpYnV0ZSBcImF1dG9jYXBpdGFsaXplXCIsIG9wdGlvbnMuYXV0b0NhcGl0YWxpemVcblx0XHRpZiBvcHRpb25zLmF1dG9mb2N1cyA9PSB0cnVlXG5cdFx0XHRAaW5wdXQuc2V0QXR0cmlidXRlIFwiYXV0b2ZvY3VzXCIsIHRydWVcblx0XHRAaW5wdXQuc2V0QXR0cmlidXRlIFwic3BlbGxjaGVja1wiLCBvcHRpb25zLnNwZWxsQ2hlY2tcblx0XHRAZm9ybSA9IGRvY3VtZW50LmNyZWF0ZUVsZW1lbnQgXCJmb3JtXCJcblxuXHRcdGlmIG9wdGlvbnMuZ29CdXR0b25cblx0XHRcdEBmb3JtLmFjdGlvbiA9IFwiI1wiXG5cdFx0XHRAZm9ybS5hZGRFdmVudExpc3RlbmVyIFwic3VibWl0XCIsIChldmVudCkgLT5cblx0XHRcdFx0ZXZlbnQucHJldmVudERlZmF1bHQoKVxuXG5cdFx0QGZvcm0uYXBwZW5kQ2hpbGQgQGlucHV0XG5cdFx0QF9lbGVtZW50LmFwcGVuZENoaWxkIEBmb3JtXG5cblx0XHRAYmFja2dyb3VuZENvbG9yID0gXCJ0cmFuc3BhcmVudFwiXG5cdFx0QHVwZGF0ZVBsYWNlaG9sZGVyQ29sb3Igb3B0aW9ucy5wbGFjZWhvbGRlckNvbG9yIGlmIEBwbGFjZWhvbGRlckNvbG9yXG5cblx0XHQjb25seSBzaG93IGhvbm9yIHZpcnR1YWwga2V5Ym9hcmQgb3B0aW9uIHdoZW4gbm90IG9uIG1vYmlsZSxcblx0XHQjb3RoZXJ3aXNlIGlnbm9yZVxuXHRcdGlmICFVdGlscy5pc01vYmlsZSgpICYmIG9wdGlvbnMudmlydHVhbEtleWJvYXJkIGlzIHRydWVcblx0XHRcdEBpbnB1dC5hZGRFdmVudExpc3RlbmVyIFwiZm9jdXNcIiwgLT5cblx0XHRcdFx0ZXhwb3J0cy5rZXlib2FyZExheWVyLmJyaW5nVG9Gcm9udCgpXG5cdFx0XHRcdGV4cG9ydHMua2V5Ym9hcmRMYXllci5zdGF0ZUN5Y2xlKClcblx0XHRcdEBpbnB1dC5hZGRFdmVudExpc3RlbmVyIFwiYmx1clwiLCAtPlxuXHRcdFx0XHRleHBvcnRzLmtleWJvYXJkTGF5ZXIuYW5pbWF0ZShcImRlZmF1bHRcIilcblxuXHR1cGRhdGVQbGFjZWhvbGRlckNvbG9yOiAoY29sb3IpIC0+XG5cdFx0QHBsYWNlaG9sZGVyQ29sb3IgPSBjb2xvclxuXHRcdGlmIEBwYWdlU3R5bGU/XG5cdFx0XHRkb2N1bWVudC5oZWFkLnJlbW92ZUNoaWxkIEBwYWdlU3R5bGVcblx0XHRAcGFnZVN0eWxlID0gZG9jdW1lbnQuY3JlYXRlRWxlbWVudCBcInN0eWxlXCJcblx0XHRAcGFnZVN0eWxlLnR5cGUgPSBcInRleHQvY3NzXCJcblx0XHRjc3MgPSBcIiMje0BpbnB1dC5pZH06Oi13ZWJraXQtaW5wdXQtcGxhY2Vob2xkZXIgeyBjb2xvcjogI3tAcGxhY2Vob2xkZXJDb2xvcn07IH1cIlxuXHRcdEBwYWdlU3R5bGUuYXBwZW5kQ2hpbGQoZG9jdW1lbnQuY3JlYXRlVGV4dE5vZGUgY3NzKVxuXHRcdGRvY3VtZW50LmhlYWQuYXBwZW5kQ2hpbGQgQHBhZ2VTdHlsZVxuXG5cdGZvY3VzOiAoKSAtPlxuXHRcdEBpbnB1dC5mb2N1cygpXG5cblx0b25Gb2N1czogKGNiKSAtPlxuXHRcdEBpbnB1dC5hZGRFdmVudExpc3RlbmVyIFwiZm9jdXNcIiwgLT5cblx0XHRcdGNiLmFwcGx5KEApXG5cblx0b25CbHVyOiAoY2IpIC0+XG5cdFx0QGlucHV0LmFkZEV2ZW50TGlzdGVuZXIgXCJibHVyXCIsIC0+XG5cdFx0XHRjYi5hcHBseShAKVxuIiwiIyMjXG5EeW5hbWljTG9hZGVyIE1vZHVsZSBmb3IgRnJhbWVySlNcbmh0dHBzOi8vZ2l0aHViLmNvbS9MdWNpZW5MZWUvZnJhbWVyLUR5bmFtaWNMb2FkZXIvXG5cbkNyZWF0ZWQgYnkgTHVjaWVuIExlZSAoQGx1Y2llbmRlZXIpLCBKYW4uIDEydGgsIDIwMTZcblxuRHluYW1pY0xvYWRlciBicmFla3MgdGhlIGJhcnJpYXJzIGJldHdlZW4gM3JkIHBhcnR5IHdlYiBkZXZlbG9wbWVudCBsaWJyYXJpZXMgYW5kIEZyYW1lciwgd2hpY2hcbmhlbHAgeW91IGxvYWQgbG9jYWwsIGV4dGVybmFsIHN0eWxlc2hlZXRzIGFuZCBzY3JpcHRzIGR5bmFtaWNhbGx5LlxuXG5BZGQgdGhlIGZvbGxvd2luZyBsaW5lIHRvIHlvdXIgcHJvamVjdCBpbiBGcmFtZXIgU3R1ZGlvLlxuXHR7RHluYW1pY0xvYWRlcn0gPSByZXF1aXJlICdEeW5hbWljTG9hZGVyJ1xuXG5bTG9hZCBvbmUgZmlsZV1cbkR5bmFtaWNMb2FkZXIuYWRkKCdzY3JpcHQuanMnKS50aGVuKC0+XG4jIHdoZW4gc2NyaXB0LmpzIGxvYWRlZCBzdWNjZXNzZnVsbHlcbi4uLlxuKS5jYXRjaCgtPlxuIyB3aGVuIHNjcmlwdC5qcyBsb2FkZWQgZmFpbGVkXG4uLi5cbilcblxuW0xvYWQgZmlsZSBpbiBzZXJpZXNdXG5EeW5hbWljTG9hZGVyLnNlcmllcyhbJ29uZS5qcycsICd0d28uY3NzJywgLi4uXSkudGhlbiggc3VjY2Vzc0NhbGxiYWNrLCBmYWlsQ2FsbGJhY2sgKVxuXG5bTG9hZCBmaWxlIGluIHBhcmFsbGVsXVxuRHluYW1pY0xvYWRlci5zZXJpZXMoWydvbmUuanMnLCAndHdvLmNzcycsIC4uLl0pLnRoZW4oIHN1Y2Nlc3NDYWxsYmFjaywgZmFpbENhbGxiYWNrIClcblxuIyMjXG5cblxuXG5cbmNsYXNzIGV4cG9ydHMuRHluYW1pY0xvYWRlclxuXG5cdCMgUHJvbWlzaWZ5IHNpbmdsZSBkeW5hbWljIHNjcmlwdCBsb2FkaW5nXG5cdEBhZGQgPSAodXJsKSAtPlxuXHRcdHByb21pc2UgPSBuZXcgUHJvbWlzZSgocmVzb2x2ZSwgcmVqZWN0KSAtPlxuXHRcdFx0aWYgdXJsLnN1YnN0ciggdXJsLmxhc3RJbmRleE9mKCcuJykgKSBpcyBcIi5qc1wiXG5cdFx0XHRcdCMgbG9hZCBzY3JpcHQgb25jZVxuXHRcdFx0XHRsb2FkZWQgPSBBcnJheS5wcm90b3R5cGUuZmluZC5jYWxsIGRvY3VtZW50LmdldEVsZW1lbnRzQnlUYWdOYW1lKCdzY3JpcHQnKSwgKGVsZW1lbnQpIC0+XG5cdFx0XHRcdFx0aWYgZWxlbWVudC5nZXRBdHRyaWJ1dGUoJ3NyYycpIGlzIHVybCB0aGVuIHJldHVybiBlbGVtZW50XG5cdFx0XHRcdGlmIGxvYWRlZCBpc250IHVuZGVmaW5lZCB0aGVuIHJldHVybiByZXNvbHZlICdoYXZlIGxvYWRlZCdcblxuXHRcdFx0XHRmaWxlID0gZG9jdW1lbnQuY3JlYXRlRWxlbWVudCAnc2NyaXB0J1xuXHRcdFx0XHRmaWxlLnNyYyA9IHVybFxuXHRcdFx0ZWxzZSBpZiB1cmwuc3Vic3RyKCB1cmwubGFzdEluZGV4T2YoJy4nKSApIGlzIFwiLmNzc1wiXG5cdFx0XHRcdCMgbG9hZCBzdHlsZSBvbmNlXG5cdFx0XHRcdGxvYWRlZCA9IEFycmF5LnByb3RvdHlwZS5maW5kLmNhbGwgZG9jdW1lbnQuZ2V0RWxlbWVudHNCeVRhZ05hbWUoJ2xpbmsnKSwgKGVsZW1lbnQpIC0+XG5cdFx0XHRcdFx0aWYgZWxlbWVudC5nZXRBdHRyaWJ1dGUoJ3JlbCcpIGlzIHVybCB0aGVuIHJldHVybiBlbGVtZW50XG5cdFx0XHRcdGlmIGxvYWRlZCBpc250IHVuZGVmaW5lZCB0aGVuIHJldHVybiByZXNvbHZlICdoYXZlIGxvYWRlZCdcblxuXHRcdFx0XHRmaWxlID0gZG9jdW1lbnQuY3JlYXRlRWxlbWVudCAnbGluaydcblx0XHRcdFx0ZmlsZS5yZWwgPSBcInN0eWxlc2hlZXRcIlxuXHRcdFx0XHRmaWxlLmhyZWYgPSB1cmxcblxuXHRcdFx0ZmlsZS5hZGRFdmVudExpc3RlbmVyICdsb2FkJywgLT5cblx0XHRcdFx0cmVzb2x2ZSBmaWxlXG5cdFx0XHRmaWxlLmFkZEV2ZW50TGlzdGVuZXIgJ2Vycm9yJywgLT5cblx0XHRcdFx0cmVqZWN0IGZpbGVcblx0XHRcdGRvY3VtZW50LmJvZHkuYXBwZW5kQ2hpbGQgZmlsZVxuXHRcdClcblxuXHRcdHJldHVybiBwcm9taXNlXG5cblx0IyBEeW5hbWljIGZpbGUgbG9hZGluZyBpbiBzZXJpZXNcblx0QHNlcmllcyA9ICh1cmxzKSAtPlxuXHRcdGlmICFBcnJheS5pc0FycmF5KHVybHMpIG9yIHVybHMubGVuZ3RoIGlzIDAgdGhlbiB0aHJvdyBcIkVSUk9SOiBOTyBVUkwgSU4gQVJSQVkhXCJcblxuXHRcdHJldHVybiB1cmxzLnJlZHVjZShcblx0XHRcdChwcm9taXNlLCB1cmwpID0+XG5cdFx0XHRcdHJldHVybiBwcm9taXNlLnRoZW4oID0+IEBhZGQodXJsKSApXG5cdFx0XHQsXG5cdFx0XHRQcm9taXNlLnJlc29sdmUoKSlcblxuXHQjIER5bmFtaWMgZmlsZSBsb2FkaW5nIGluIHBhcmFsbGVsXG5cdEBwYXJhbGxlbCA9ICh1cmxzKSAtPlxuXHRcdGlmICFBcnJheS5pc0FycmF5KHVybHMpIG9yIHVybHMubGVuZ3RoIGlzIDAgdGhlbiB0aHJvdyBcIkVSUk9SOiBOTyBVUkwgSU4gQVJSQVkhXCJcblxuXHRcdFByb21pc2UuYWxsKFxuXHRcdFx0dXJscy5tYXAoICh1cmwpID0+XG5cdFx0XHRcdHJldHVybiBAYWRkKHVybClcblx0XHQpKSIsIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dmFyIGY9bmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKTt0aHJvdyBmLmNvZGU9XCJNT0RVTEVfTk9UX0ZPVU5EXCIsZn12YXIgbD1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwobC5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxsLGwuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBS0FBOztBREFBOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7QUFnQ00sT0FBTyxDQUFDOzs7RUFHYixhQUFDLENBQUEsR0FBRCxHQUFPLFNBQUMsR0FBRDtBQUNOLFFBQUE7SUFBQSxPQUFBLEdBQWMsSUFBQSxPQUFBLENBQVEsU0FBQyxPQUFELEVBQVUsTUFBVjtBQUNyQixVQUFBO01BQUEsSUFBRyxHQUFHLENBQUMsTUFBSixDQUFZLEdBQUcsQ0FBQyxXQUFKLENBQWdCLEdBQWhCLENBQVosQ0FBQSxLQUFzQyxLQUF6QztRQUVDLE1BQUEsR0FBUyxLQUFLLENBQUMsU0FBUyxDQUFDLElBQUksQ0FBQyxJQUFyQixDQUEwQixRQUFRLENBQUMsb0JBQVQsQ0FBOEIsUUFBOUIsQ0FBMUIsRUFBbUUsU0FBQyxPQUFEO1VBQzNFLElBQUcsT0FBTyxDQUFDLFlBQVIsQ0FBcUIsS0FBckIsQ0FBQSxLQUErQixHQUFsQztBQUEyQyxtQkFBTyxRQUFsRDs7UUFEMkUsQ0FBbkU7UUFFVCxJQUFHLE1BQUEsS0FBWSxNQUFmO0FBQThCLGlCQUFPLE9BQUEsQ0FBUSxhQUFSLEVBQXJDOztRQUVBLElBQUEsR0FBTyxRQUFRLENBQUMsYUFBVCxDQUF1QixRQUF2QjtRQUNQLElBQUksQ0FBQyxHQUFMLEdBQVcs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
