---
orphan: true
---
```{warning}
Historical pages
```
  <head>
    <title>Auto Configure Nightscout?</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <style type="text/css">
    </style>
  </head>
  <body>
    <div id="workflow" class="container">
      <form id="inputs" action="#" method="GET" class="form-inline" role="form">
        <legend><h1>How do we configure Nightscout?</h1></legend>
        <div role="tabpanel">
          <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="">
              <a href="#MQTT" aria-controls="MQTT" role=tab" data-toggle="tab">MQTT</a>
            </li>
            <li role="presentation" class="active">
              <a href="#REST_APIs" aria-controls="REST" role=tab" data-toggle="tab">REST API</a>
            </li>
            <li role="presentation" class="">
              <a href="#MONGODB" aria-controls="MONGO" role=tab" data-toggle="tab">MONGO</a>
            </li>
            <li role="presentation" class="">
              <a href="#WebApp" aria-controls="WebApp" role=tab" data-toggle="tab">WebApp</a>
            </li>
          </ul>
          <div class="tab-content">
            <div role="tabpanel" class="tab-pane" id="MQTT">
              <fieldset id="mqtt_apis" class="values has-feedback">
                <legend></legend>
                <h3>Step 1: Sign up for an account at CloudMQTT</h3>
                <p><a href="http://cloudmqtt.com">Click here</a> to sign up and create your MQTT server</p> 
                <h3>Step 2: Enter your MQTT server information below
              </fieldset>
              <fieldset class="mqtt-values mqtt-creds container">
                <div class="column form-group has-error has-feedback">
                  <label class="mqtt-host control-label"><tt>MQTT Host:</tt>
                    <input type="text" name="host" class="v host form-control"
                      placeholder="m01.cloudmqtt.com" />
                    <span class="icon glyphicon glyphicon-question-sign form-control-feedback"></span>
                  </label>
                  <span class="hide glyphicon glyphicon-ok form-control-feedback"></span>
                </div>
                <div class="column form-group has-error has-feedback">
                  <label><tt>Port:</tt>
                  <input type="text" name="port" class="v port form-control"
                    placeholder="12424" />
                  </label>
                </div>
                <div class="row">
                <div class="column form-group has-error has-feedback">
                  <label><tt>Username:</tt>
                    <input type="text" name="user" class="v user form-control"
                      placeholder="user"/>
                  </label>
                </div>
                <div class="column form-group has-error has-feedback">
                  <label><tt>Password:</tt>
                  <input type="password" name="pass" class="v pass form-control"
                    placeholder="passw0rd" />
                  </label>
                </div>
                </div>
              </fieldset>
            </div>
            <div role="tabpanel" class="tab-pane active" id="REST_APIs">
              <fieldset id="rest_api" class="values has-feedback">
                <legend>REST API
                  <button class="btn" id="add_rest">
                    <span class="glyphicon glyphicon-plus"></span>
                  </button>
                </legend>
                <h3>Enter your API_SECRET and REST API URL below.</h3>
                <p>Your API_SECRET must be 12 characters or more</p>
                <p>Your REST API URL format should be https://foobar.azurewebsites.net/api/v1</p>
                <p>Change foobar to your personal site name, and don't forget to add /api/v1 to the end of the URL.</p>
                <div class="hide template skeleton rest">
                  <div class="form-group has-error has-feedback" title="If set must be at least 12 characters long.">
                    <label class="restsecret control-label"><tt>API_SECRET:</tt>
                      <input type="text" name="api_secret" class="v api_secret form-control"
                        placeholder="atleast12characterslong" />
                      <span class="icon glyphicon glyphicon-question-sign form-control-feedback"></span>
                    </label>
                    <span class="hide glyphicon glyphicon-ok form-control-feedback"></span>
                  </div>
                  <br/>
                  <div class="form-group has-error has-feedback">
                    <label class="restlocation control-label"><tt>REST API URL:</tt>
                      <input type="text" name="resturi" class="v resturi form-control"
                        placeholder="https://foobar.azurewebsites.net/api/v1" />
                      <span class="icon glyphicon glyphicon-question-sign form-control-feedback"></span>
                    </label>
                    <span class="hide glyphicon glyphicon-ok form-control-feedback"></span>
                  </div>
                </div>
              </fieldset>
            </div>
            <div role="tabpanel" class="tab-pane" id="MONGODB">
          <fieldset id="stage1" class="values has-feedback">
            <legend></legend>
            <h3>Step 1: Sign up for a Mongolab account and create a database</h3>
            <p>
            Detailed instructions are available at <a href="http://www.nightscout.info/wiki/welcome/configuring-the-data-backend" target="_blank">nightscout.info</a>.  If you already have a Mongo database for Nightscout, skip this step.
            </p>
            <h3>Step 2: Enter your Mongo server, port and database name</h3>
            <p>For example: ds012345.mongolab.com:12345/databasename</p>
            <div class="form-group has-error has-feedback">
              <label class="mongolocation control-label">Mongo server, port, and db:
                <input type="text" name="netloc" class="v netloc form-control"
                  placeholder="ds012345.mongolab.com:12345/cgmdb" />
                <span class="icon glyphicon glyphicon-question-sign form-control-feedback"></span>
              </label>
              <span class="hide glyphicon glyphicon-ok form-control-feedback"></span>
            </div>
          </fieldset>
          <fieldset id="stage2" class="values has-feedback">
            <h3>Step 3: Enter the db username and password for your database</h3>
            <legend></legend>
            <div class="form-group has-error has-feedback">
              <label><tt>Username:</tt>
                <input type="text" name="user" class="v user form-control"
                  placeholder="user"/>
              </label>
            </div>
            <div class="form-group has-error has-feedback">
              <label><tt>Password:</tt>
              <input type="password" name="pass" class="v pass form-control"
                placeholder="passw0rd" />
              </label>
            </div>
          </fieldset>
        <fieldset id="finish" class="values">
          <p>
          </p>
          <input type="disabled" disabled="disabled" name="prefix" class="v prefix" value="mongodb://"/>
          <input type="text" name="user" class="v user"
            placeholder="user"/>
          <tt class="v interstitial">:</tt>
          <input type="password" name="pass" class="v pass"
            placeholder="passw0rd" />
          <tt class="v interstitial">@</tt>
          <input type="text" name="hostname" class="v hostname"
            placeholder="hostname:port" />
          <tt class="v interstitial">/</tt>
          <input type="text" name="db" class="v db"
            placeholder="db" />
          <button type="button" class="btn btn-primary btn-lg format" name="format"
              value="format">Format</button>
          <button type="reset" class="btn btn-warning reset clear" name="clear"
              value="Clear">Clear</button>
        </fieldset>
            </div>
            <div role="tabpanel" class="tab-pane" id="WebApp">
              <table id="web_config">
                <tr>
                  <th colspan="3">
                    <h3>Required</h3>
                  </th>
                </tr>
                <tr>
                  <td>
                  <code>MONGO_CONNECTION</code>
                  </td>
                  <td>
                    <code class="env var mongo"></code>
                  </td>
                  <td> <tt>Custom</tt>
                  </td>
                </tr>
                <tr>
                  <th colspan="3">
                    <h3>Required for REST API </h3>
                  </th>
                </tr>
                <tr>
                  <td>
                  <code>API_SECRET</code>
                  </td>
                  <td>
                    <code class="env var api_secret"></code>
                  </td>
                  <td> <tt>Custom</tt>
                  </td>
                </tr>
              </table>
              <div class="well">
              </div>
            </div>
          </div>
        </div>
      </form>
      <div id="output" class="jumbotron">
        <p>
          <tt id="uri"></tt>
        </p>
        <div id="qrcode"> </div>
        <pre id="json"></pre>
      </div>
    </div>
    <div id="dependencies">
      <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js">
      </script>
      <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery.qrcode/1.0/jquery.qrcode.min.js">
      </script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </div>
    <div id="js">
      <!-- Latest compiled and minified JavaScript -->
      <script type="text/javascript">
        function do_format (ev) {
          var base = $(ev.data.base);
          var parts = base.find('#finish .v');
          var out = [ ];
          if ($(ev.target).is('.reset')) {
            console.log('CLEAR');
            base.find(':input').not(':disabled').val('');
          }
          base.trigger('render');
          // base.find(ev.data.uri).text(uri);
          // base.find(ev.data.qrcode).empty( ).qrcode(uri);
        }
        function get_data (opts) {
          var base = $(opts.base);
          var parts = base.find('#finish .v');
          var out = [ ];
          parts.each(function iter (i) {
            var v = $(this);
            var r = '';
            if (v.is(':input') && v.val && v.val.call) {
              r = v.val( );
            } else {
              r = v.text( );
            }
            out.push(r.trim( ));
          });
          var uri = out.join('').trim( );
          var apis = get_rest_uris(opts);
          var mqtt = get_mqtt_uri(opts);
          var data = {
            mongo: { uri: uri }
          , rest: { endpoint: apis }
          };
          if (mqtt != 'ssl://:@:') {
            data.mqtt = { uri: mqtt };
          }
          if (data.mongo.uri == 'mongodb://:@/') {
            delete data.mongo;
          }
          if (!apis.length > 0) {
            delete data.rest;
          }
          return data;
        }
        function valid_rest_uri (i, v) {
            var el = $(this);
            var secret = el.find('.v.api_secret').val( );
            var url = el.find('.v.resturi').val( );
            var sep = '://';
            var parts = url.split(sep);
            var netloc = parts.pop( );
            var scheme = parts.pop( );
            if (scheme && netloc && parts.length === 0) {
              if (secret.length > 11) {
                el.find('.form-group.has-feedback .restsecret')
                  .find('.glyphicon-question-sign')
                  .removeClass('glyphicon-question-sign')
                  .addClass('glyphicon-ok');
                if (scheme.indexOf('http') === 0) {
                  el.find('.form-group.has-feedback')
                    .removeClass('has-error').addClass('has-success');
                  el.find('.form-group.has-feedback .restlocation')
                    .find('.glyphicon-question-sign')
                    .removeClass('glyphicon-question-sign')
                    .addClass('glyphicon-ok');
                  url = [ scheme, sep, encodeURIComponent(secret), '@', netloc ].join('');
                  return url;
                }
              }
            }
        }
        function get_rest_uris (opts) {
          var base = $(opts.base);
          var uris = base.find('#rest_api .rest.template')
            .not('.skeleton')
            .map(valid_rest_uri);
          return uris.get( );
        }
        function get_mqtt_uri (opts) {
          var base = $(opts.base);
          var controls = base.find('#MQTT');
          var prefix = 'ssl://'
          var host = controls.find('.v.host').val( );
          var user = controls.find('.v.user').val( );
          var pass = controls.find('.v.pass').val( );
          var port = controls.find('.v.port').val( );
          var uri = [ prefix, [user, pass].join(':')
                    , '@', [host, port].join(':') ].join('');
          return uri;
        }
        function render (ev) {
          var base = $(ev.data.base);
          var conf = get_data(ev.data);
          if ($(ev.target).is('.reset')) {
            console.log('CLEAR');
            base.find(':input').not(':disabled').val('');
          }
          if (conf.mongo && conf.mongo.uri) {
            base.find(ev.data.uri).text(conf.mongo.uri);
            base.find('.env.var.mongo').text(conf.mongo.uri)
          }
          if (conf.rest && conf.rest.endpoint) {
            var api_secret = base.find('.template').not('.skeleton').filter(':first').find('.v.api_secret:first').val( );
            base.find('.env.var.api_secret').text(api_secret)
          }
          base.find(ev.data.qrcode).empty( ).qrcode(JSON.stringify(conf));
          base.find('#json').text(JSON.stringify(conf));
        }
        var config = {
          base: '#workflow'
        , inputs: '#inputs'
        , output: '#output'
        , uri: '#output #uri'
        , qrcode: '#qrcode'
        };
        function stage1 (ev) {
          var dbFound = false;
          var base = $(ev.data.base);
          if (ev.type == 'keyup') {
            switch (ev.which) {
              case 46: // '.'
              case 47: // '/'
              case 58: // ':'
                dbFound = true;
                base.find("#stage1 .form-group.has-feedback")
                  .removeClass("has-error")
                  .addClass("has-warning");
              default:
                break;
            }
          }
          var target = $(ev.target);
          var netloc = $(ev.target).val( ).trim( ).split('/');
          if (netloc.length > 0) {
            var host = (netloc.shift( ) || '').trim( );
            var db = (netloc.pop( ) || '').trim( );
            var finish = base.find('#finish');
            finish.find('INPUT.v.hostname').val(host);
            finish.find('INPUT.v.db').val(db);
            if (db.length >=  2) {
              base.trigger('stage1');
              base.find("#stage1 .form-group.has-feedback")
                .removeClass("has-error has-warning")
                .addClass("has-success")
                ;
              base.find("#stage1 .form-group.has-feedback .mongolocation")
                .removeClass('glyphicon-question-sign')
                .addClass('glyphicon-ok')
                ;
            }
          }
          base.trigger('render');
          // finish.trigger('change');
        }
        function stage2 (ev) {
          var target = $(ev.target);
          var base = $(ev.data.base);
          var finish = base.find('#finish');
          var stage = base.find('#stage2');
          finish.find('INPUT.v.user').val(stage.find('INPUT.v.user').val( ));
          finish.find('INPUT.v.pass').val(stage.find('INPUT.v.pass').val( ));
          target.closest('.form-group.has-feedback')
              .removeClass('has-warning')
              .removeClass('has-error')
              .addClass('has-success')
              ;
          base.trigger('render');
        }
        function clone_rest_api (opts) {
          var base = $(opts.base);
          var container = base.find('#rest_api');
          var clone = container.find('.skeleton.template.rest').clone(true)
            .removeClass('skeleton')
            .removeClass('hide');
          container.append(clone);
          return clone;
        }
        function add_rest (ev) {
          clone_rest_api(ev.data);
        }
        function cancel (ev) {
          ev.preventDefault( );
          return false;
        }
        function prep_mqtt (ev) {
          var base = $(ev.data.base);
          var uri = get_mqtt_uri(ev.data);
          console.log('rendering', uri);
          base.trigger('render');
          var pieces = uri.split('@');
          var tail = pieces.pop( );
          var head = pieces.pop( );
          console.log('one', pieces);
          if (tail && head && pieces.length == 0) {
            pieces = head.split(':')
            var pass = pieces.pop( );
            var user = pieces.pop( );
            var scheme = pieces.pop( );
            console.log('two', pieces);
            if (user.length > 2 && pass.length > 0 && scheme == 'tcp' && pieces.length == 0) {
              pieces = tail.split(':');
              var port = pieces.pop( );
              var host = pieces.pop( );
              console.log('three', pieces);
              if (pieces.length == 0 && port.length > 0 && host.length > 0) {
                console.log('four', pieces);
                base.find('#MQTT .glygphicon-question-sign')
                  .removeClass('glygphicon-question-sign')
                  .addClass('glygphicon-ok')
                  ;
                base.find('#MQTT .has-feedback')
                  .removeClass('has-error has-warning')
                  .addClass('has-success')
                  ;
              }
            }
          }
        }
        function init (ev) {
          $(config.base).on('change keyup', '#stage1', ev.data, stage1);
          $(config.base).on('change keyup', '#stage2', ev.data, stage2);
          $(config.base).on('change keyup', '#MQTT', ev.data, prep_mqtt);
          $(config.base).on('change keyup', ev.data, do_format);
          $(config.base).on('render', ev.data, render);
          $(config.base + ' button.btn').on('click', ev.data, do_format);
          clone_rest_api(ev.data);
          // console.log('hello');
          do_format.apply(this, arguments);
          $(config.base).on('click', '#add_rest', ev.data, add_rest);
          $(config.base).on('submit', 'FORM', ev.data, cancel);
        }
        $(document).on('ready', config, init);
      </script>
    </div>
  </body>

