module Pharrell
  module Injectable
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def injected(name, klass)
        define_method(name) do
          @__pharrell_cache__ ||= {}
          @__pharrell_cache__[klass] ||= Pharrell.instance_for(klass)
        end
      end
    end
  end
end
