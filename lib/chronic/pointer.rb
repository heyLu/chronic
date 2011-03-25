module Chronic

  class Pointer < Tag #:nodoc:
    def self.t sym; Chronic.translate sym end

    def self.scan(tokens)
      # for each token
      tokens.each_index do |i|
        if t = self.scan_for_all(tokens[i]) then tokens[i].tag(t) end
      end
      tokens
    end

    def self.scan_for_all(token)
      scanner = {/\b#{ :PAST}\b/ => :past,
                 /\b#{t :FUTURE}\b/ => :future,
                 /\b#{t :FUTURE_IN}\b/ => :future}
      scanner.keys.each do |scanner_item|
        return self.new(scanner[scanner_item]) if scanner_item =~ token.word
      end
      return nil
    end

    def to_s
      'pointer-' << @type.to_s
    end
  end

end
