class ConStruct
  def self.new(*properties, &block)
    klass = Class.new do
      @properties = properties
      attr_accessor *properties

      def initialize(*values)
        values.each_with_index do |value, index|
          send("#{self.class.properties[index]}=", value)
        end
      end

      def [](key)
        send key
      end

      def []=(key, value)
        send "#{key}=", value
      end

      def self.properties
        @properties
      end
    end
    klass.class_eval(&block)
    klass
  end
end

Product = ConStruct.new(:id, 'name') do
  def to_s
    "<#{self.class} id:#{id} name:'#{name}'>"
  end
end

obj = Product.new(1, "Ruby Book")

puts
puts Product.instance_methods(false).inspect
puts obj.inspect
puts obj.name
puts obj[:name]
puts obj['name'] = 'Ruby Video Course'
puts obj.inspect
puts obj.to_s
