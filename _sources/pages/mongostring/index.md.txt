---
orphan: true
---

```{warning}
Historical pages
```

  <head>
    <title>What's my mongodb URI?</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
  </head>
  <body>
    <div id="workflow" class="container">
      <form id="inputs" action="#" method="GET" class="form-inline" role="form">
        <legend><h1>What is my MONGODB URI?</h1></legend>
        <fieldset id="stage1" class="values has-feedback">
          <legend>Create database</legend>
          <h2>Step 1: Sign up for an account to manage your database</h2>
          <p>
          <a href="https://mongolab.com/">Mongolab</a> has a free sign up.
          </p>
          <h2>Step 2: Create a database</h2>
          <div class="form-group has-error has-feedback">
            <label class="mongolocation control-label">Create a database
              <input type="text" name="netloc" class="v netloc form-control"
                placeholder="sub023405.mongolab.com:23405/cgmdb" />
              <span class="icon glyphicon glyphicon-question-sign form-control-feedback"></span>
            </label>
            <span class="hide glyphicon glyphicon-ok form-control-feedback"></span>
          </div>
        </fieldset>
        <fieldset id="stage2" class="values has-feedback">
          <h2>Step 3: Create a user for your new database</h2>
          <legend>Create a user for the database</legend>
          <div class="form-group has-error has-feedback">
            <label><tt>Username:</tt>
              <input type="text" name="user" class="v user form-control"
                placeholder="user"/>
            </label>
          </div>
          <div class="form-group has-error has-feedback">
            <label><tt>Password</tt>
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
      </form>
      <div id="output" class="jumbotron">
        <p>
          <tt id="uri"></tt>
        </p>
        <div id="qrcode"> </div>
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
          base.trigger('render', uri);
          base.find(ev.data.uri).text(uri);
          base.find(ev.data.qrcode).empty( ).qrcode(uri);
        }
        function render (ev) {
          var base = $(ev.data.base);
          var parts = base.find('#finish .v');
          var out = [ ];
          if ($(ev.target).is('.reset')) {
            console.log('CLEAR');
            base.find(':input').not(':disabled').val('');
          }
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
          base.find(ev.data.uri).text(uri);
          base.find(ev.data.qrcode).empty( ).qrcode(uri);
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
        function init (ev) {
          $(config.base).on('change keyup', '#stage1', config, stage1);
          $(config.base).on('change keyup', '#stage2', config, stage2);
          $(config.base).on('change', config, do_format);
          $(config.base).on('render', config, render);
          $(config.base + ' button.btn').on('click', config, do_format);
          // console.log('hello');
          do_format.apply(this, arguments);
        }
        $(document).on('ready', config, init);
      </script>
    </div>
