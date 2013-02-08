require "ltsv/version"

class LTSV
  COLUMN_DELIMITER = "\t".freeze
  KEY_DELIMITER = ':'.freeze

  attr_accessor :labels, :hashed_line

  def initialize(labels = @labels)
    @labels = labels
  end

  def bind(data)
    a = [@labels, data].transpose
    @hashed_line = Hash[*a.flatten]
    self
  end

  def to_s(hashed_line = @hashed_line)
    [].tap {|a|
      hashed_line.each {|k,v| a.push combine(k, v) }
    }.join(COLUMN_DELIMITER)
  end

  def self.parse_line(ltsv)
    @hashed_line = {}.tap {|h|
      ltsv.split(COLUMN_DELIMITER).each do |column|
        k,v = *column.split(KEY_DELIMITER)
        h[k.to_sym] = v
      end
    }
  end

  private
  def combine(label, data)
    "#{label}:#{data}"
  end
end
