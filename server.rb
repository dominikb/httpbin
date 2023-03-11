require 'sinatra'
require 'sinatra/custom_logger'
require 'logger'

set :logger, Logger.new(STDOUT)

log = Proc.new do
    logger.info request
end

%i[ get post put patch delete options ].each do |verb|
    send(verb, '/*', &log)
end