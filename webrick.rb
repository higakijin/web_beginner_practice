require 'webrick'

server = WEBrick::HTTPServer.new({ 
  :DocumentRoot => './',
  :BindAddress => '127.0.0.1',
  :Port => 8000
})

server.mount_proc("/time") do |req, res|
  # レスポンス内容を出力
  body = "#{DateTime.now}"
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.mount_proc("/form_get") do |req, res|
  body = "
          <html>
          <head>
            <meta charset='UTF-8'>
          </head>
          <body>
            クエリパラメータは#{req.query}です　<br/>こんにちは#{req.query['username']}さん。あなたの年齢は#{req.query['age']}ですね
          <body>
          "
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.mount_proc("/form_post") do |req, res|
  req.query
  body = "
          <html>
          <head>
            <meta charset='UTF-8'>
          </head>
          <body>
            クエリパラメータは#{req.query}です　<br/>こんにちは#{req.query['username']}さん。あなたの年齢は#{req.query['age']}ですね
          <body>
          "
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.start
