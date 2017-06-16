class HTML < BasicObject
  def initialize(&block)
    @rendered_html = ''
    instance_eval(&block)
  end

  def method_missing(tag, *args, &block)
    properties = ''

    if args.first.is_a?(::Object::Hash)
      properties = args.shift.map { |p| p.join("=") } * ' '
    end
    @rendered_html << "<#{tag} #{properties}>"
    if block
      instance_eval(&block)
    else
      @rendered_html << "#{args.first}"
    end
    @rendered_html << "</#{tag}>"
  end

  def render
    @rendered_html
  end
end


html = HTML.new do
  h2 "Why is Arbre awesome?"
  code 'some code'

  ul id: 'nav', class: 'list-squares' do
    li "The DOM is implemented in ruby"
    li "You can create object oriented views"
    li "Templates suck"
  end

  p "Some paragraph"
  p "Another paragraph"
end

puts html.render
