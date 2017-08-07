require 'slack-ruby-bot'
require 'dotenv/load'
require 'botmetrics'

class PongBot < SlackRubyBot::Bot
  SLACK_API_TOKEN=ENV['SLACK_API_TOKEN']
  botmetrics = BotMetrics::Client.new
  botmetrics.register_bot!(ENV['SLACK_API_TOKEN'])


  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end
end

PongBot.run