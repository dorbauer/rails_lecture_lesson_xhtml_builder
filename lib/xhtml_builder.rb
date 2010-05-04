class XHTMLBuilder
  
  attr_reader :content
  
  def initialize
    @content = ""
    @valid_tags = ["h1","h2","html","head","title","body","b","i","div","ul","li","p"]
  end
  
  def generate_content( tag_name, arg, &block )
    @content << "<#{tag_name}>\n"
    if block_given?
      yield
    elsif arg
      @content << arg + "\n"
    end
    @content << "</#{tag_name}>\n"
  end
  
  def method_missing( methode_name, *args, &block)
    if @valid_tags.include?(methode_name.to_s)
      generate_content(methode_name,args[0],&block)
    else
      generate_content("p",args[0],&block)
    end
  end
  
end

