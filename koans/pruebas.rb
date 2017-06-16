module Custom
  module Concern
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def in_class(&block)
        @included_block = block
      end

      def included(base)
        base.class_eval &@included_block
      end
    end
  end
end

module MyModule
  include Custom::Concern

  def instance_method
    'instance method'
  end

  in_class do
    attr_accessor :foo
  end
end

class MyClass
  include MyModule
end

puts MyClass.new.instance_method
puts MyClass.instance_methods(false).inspect
puts
