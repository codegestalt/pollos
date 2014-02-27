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

    # Public: Tells each job to go and check their endpoint
    def fetch_targets!
      self.targets.each {|t| t.fetch!}
    end

  end
end
