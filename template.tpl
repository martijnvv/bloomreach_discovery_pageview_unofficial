___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "br_acc_id",
    "displayName": "Bloomreach Account ID",
    "simpleValueType": true
  },
  {
    "type": "SELECT",
    "name": "br_tr_version",
    "displayName": "Tracker Version ID",
    "macrosInSelect": true,
    "selectItems": [
      {
        "value": "v1",
        "displayValue": "v1"
      }
    ],
    "simpleValueType": true,
    "help": "Default value is v1"
  },
  {
    "type": "TEXT",
    "name": "br_domain_key",
    "displayName": "Bloomreach Domain Key",
    "simpleValueType": true
  },
  {
    "type": "SELECT",
    "name": "br_page_type",
    "displayName": "Page Type",
    "macrosInSelect": true,
    "selectItems": [
      {
        "value": "conversion",
        "displayValue": "Conversion"
      },
      {
        "value": "category",
        "displayValue": "Category"
      },
      {
        "value": "homepage",
        "displayValue": "Home Page"
      },
      {
        "value": "content",
        "displayValue": "Content"
      },
      {
        "value": "product",
        "displayValue": "Product"
      },
      {
        "value": "other",
        "displayValue": "Other"
      },
      {
        "value": "search",
        "displayValue": "Search"
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "SELECT",
    "name": "br_page_title",
    "displayName": "Page Title",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true
  },
  {
    "type": "SELECT",
    "name": "br_referrer",
    "displayName": "Document Referrer",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true
  },
  {
    "type": "SELECT",
    "name": "br_orig_ref_url",
    "displayName": "Original Referral URL",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "br_user_id",
    "displayName": "User ID",
    "simpleValueType": true,
    "help": "See documentation \u003ca href\u003d\"https://documentation.bloomreach.com/discovery/docs/pixel-parameters-recommended-implementation#br_datauser_id-parameter-overview\"\u003e about the user ID\u003c/a\u003e"
  },
  {
    "type": "GROUP",
    "name": "content",
    "displayName": "Content Variables",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "br_content_cat",
        "displayName": "Content Catalogs",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "br_content_item_id",
        "displayName": "Content Item ID",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "br_content_item_name",
        "displayName": "Content Item Name",
        "simpleValueType": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "category",
    "displayName": "Category Variables",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "br_cat_id",
        "displayName": "Category ID",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "br_cat_name",
        "displayName": "Category Name",
        "simpleValueType": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "product",
    "displayName": "Product Variables",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "br_prod_id",
        "displayName": "Product ID",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "br_prod_sku",
        "displayName": "Product SKU",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "br_prod_name",
        "displayName": "Product Name",
        "simpleValueType": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "search",
    "displayName": "Search Variables",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "br_search_term",
        "displayName": "Search Term",
        "simpleValueType": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "conversion",
    "displayName": "Conversion Variables",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "br_basket_value",
        "displayName": "Basket Value",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "br_order_id",
        "displayName": "Order ID / Transaction ID",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "br_items",
        "displayName": "Basket Items",
        "simpleValueType": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "Debug Options",
    "displayName": "Debug Options",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "debug",
        "checkboxText": "Log debug messages to console",
        "simpleValueType": true
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Require the necessary APIs
const logToConsole = require('logToConsole');
const injectScript = require('injectScript');
const queryPermission = require('queryPermission');
const window = require('setInWindow');
const get_url = require('parseUrl');
const encodeUriComponent = require('encodeUriComponent');
// get variables from fields in template
const br_acc_id = data.br_acc_id;
const debug_mode = data.debug;
const br_tracker_version = data.br_tr_version;

// populate the br_data object with basic data
var br_data = br_data || {};
br_data.acct_id = data.br_acc_id; 
br_data.title = data.br_page_title;
br_data.domain_key = data.br_domain_key;
br_data.ptype = data.br_page_type;
br_data.origin_source = 'gtm_tag';
br_data.ref = data.br_referrer;
br_data.orig_ref_url = data.br_orig_ref_url;
br_data.user_id = data.br_user_id || "";
br_data.debug = data.debug;


if(data.br_page_type == 'content'){
  br_data.item_id = data.br_content_item_id;
  br_data.item_name = data.br_content_item_name;
  br_data.catalogs = [{ name : data.br_content_cat }];
} else if(data.br_page_type == 'category'){
  br_data.cat_id = data.br_cat_id;
  br_data.cat = data.br_cat_name;      
} else if(data.br_page_type == 'product'){
  br_data.prod_name = data.br_prod_name;  
  br_data.prod_id = data.br_prod_id;
  br_data.sku = data.br_prod_sku;      
} else if(data.br_page_type == 'search'){
  br_data.search_term = data.br_search_term;
  br_data.catalogs = [{ name : data.br_content_cat }];    
} else if(data.br_page_type == 'conversion'){
  br_data.is_conversion = 1;
  br_data.basket_value = data.br_basket_value;
  br_data.order_id = data.br_order_id;    
  br_data.basket = {'items': data.br_items };
}

// Get the URL the user input into the text field
const url = "https://cdn.brcdn.com/" + encodeUriComponent(data.br_tr_version) + "/br-trk-" + encodeUriComponent(data.br_acc_id) + ".js";

// If the user chose to log debug output, initialize the logging method
const log = data.debug ? logToConsole : (() => {});
if(debug_mode){
log('Bloomreach: Loading script from ' + url);
}
// If the script loaded successfully, log a message and signal success

const onSuccess = () => {
  if(debug_mode){
    log('Bloomreach: Script loaded successfully.');
    log(br_data);
    }
  data.gtmOnSuccess();
};

// If the script fails to load, log a message and signal failure
const onFailure = () => {
  if(debug_mode){
    log('Bloomreach: Script load failed.');
    log(br_data);
  }  
  data.gtmOnFailure();
};

// If the URL input by the user matches the permissions set for the template,
// inject the script with the onSuccess and onFailure methods as callbacks.
if (queryPermission('inject_script', url)) {
  window('br_data', br_data, true);
  injectScript(url, onSuccess, onFailure);
} else {
  if(debug_mode){
    log('Bloomreach: Script load failed due to permissions mismatch.');
  }
  data.gtmOnFailure();
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cdn.brcdn.com/"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "br_data"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 12-8-2024, 14:57:33


