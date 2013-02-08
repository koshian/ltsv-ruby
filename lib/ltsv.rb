require "ltsv/version"

class LTSV
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
    result = Array.new
    hashed_line.each {|k,v| result.push combine(k, v) }
    result.join("\t")
  end

  def self.parse_line(ltsv)
    @hashed_line = Hash.new
    ltsv.split("\t").each do |col|
      k,v = col.split(':')
      @hashed_line[k] = v
    end
    @hashed_line
  end

  private
  def combine(label, data)
    "#{label}:#{data}"
  end
end
