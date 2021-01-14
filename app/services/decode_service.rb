module DecodeService
  def self.attach_image(file, target)
    image = Rails.env.test? ? file : split_base64(file)
    decoded_data = Base64.decode64(image[:data])
    io = StringIO.new
    io.puts(decoded_data)
    io.rewind
    target.attach(io: io, filename: "#{image[:encoder]}.#{image[:extension]}")
  end

  private_methods

  def self.split_base64(string)
    if string =~ /^data:(.*?);(.*?),(.*)$/
      uri = {}
      uri[:type] = Regexp.last_match(1)
      uri[:encoder] = Regexp.last_match(2)
      uri[:data] = Regexp.last_match(3)
      uri[:extension] = Regexp.last_match(1).split('/')[1]
      uri
    end
  end
end
