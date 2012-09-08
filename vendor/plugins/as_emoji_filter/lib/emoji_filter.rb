class EmojiFilter < AsakusaSatellite::Filter::Base
  def process(text, opts={})
    root = URI(ENV["AS_EMOJI_URL_ROOT"]+"/")
    text.gsub!(/:([^:\s]+):/) do
      icon = $1
      url = root + URI.escape("#{icon}.png",/[^-_.!~*'()a-zA-Z\d;\/?:@&=$,\[\]]/n)
      %(<img src="#{url}" style="width:16px" title="#{icon}" alt="#{icon}"/>)
    end
    text
  rescue
    text
  end
end
