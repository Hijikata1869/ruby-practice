require 'net/http'
require 'uri'
require 'json'

module LogFormatter
  def self.format_log
    uri = URI.parse('https://samples.jnito.com/access-log.json')
    json = Net::HTTP.get(uri)
    JSON.parse(json, symbolize_names: true)
  end
end

log_data =  LogFormatter.format_log

log_data.map do | data | 
  case data
  in {request_id:, path:, status: 404 | 500 => status, error:}
    puts "[ERROR] request_id=#{request_id}, path=#{path}, status=#{status}, error=#{error}"
  in {request_id:, path:, duration: 1000.. => duration}
    puts "[WARN] request_id=#{request_id}, path=#{path}, duration=#{duration}"
  in {request_id:, path:}
    puts "[OK] request_id=#{request_id}, path=#{path}"
  end
end