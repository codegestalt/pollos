module Pollos
  class Job
    def initialize(hash)
      hash.each {|h| targets << Target.new(h)}
    end

    def targets
      @targets ||= []
    end

    def <<(target)
      targets << target
    end

    def to_hash
      array = []
      self.targets.each {|t| array << t.to_hash}
      array
    end
  end
end
