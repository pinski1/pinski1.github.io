  module Jekyll
  
  class CategoryTree < Liquid::Tag

    class Category < Array

      attr_reader :name, :link, :parent_name

      def initialize(name, link, parent_name)
        @name = name
        @link = link
        @parent_name = parent_name 
      end

      def is_parent_of?(category)
        self.map { |c| c == category }.any?
      end

      def to_html()
        html = ''
        html << "<li><a href='#{@link}'>#{name}</a></li>"
        unless self.empty?
          html << "<ul>"
          html << self.sort { |c1, c2| c1.name <=> c2.name }.map(&:to_html).join("")
          html << "</ul>"
        end
        html
      end

    end

    def initialize(tag_name, markup, tokens)
      @opts           = {}
      @config         = nil
      @category_names = Array.new
      @categories     = Array.new
      @category_dir   = nil
      @tree_suffix    = nil
      @tree           = Array.new
      super
    end 

    def setup(context)
      @config         = context.registers[:site].config
      @category_names = context.registers[:site].categories.keys
      @category_dir   = @config['root'] + @config['category_dir'] + '/'
      @tree_suffix    = @config['category_tree_suffix'] || "_is_in"
    end

    def to_category_key(str)
      str.gsub(" ","_") + @tree_suffix
    end

    def render(context)
      setup(context)

      @categories = @category_names.map { |c| Category.new(c, linkpath_to(c), get_parent_name(c)) }

      #
      # All categories which have no parent are in tree now
      # 

      until @categories.empty?
        @categories.each_with_index do |category,i|
          if get_parent_name( category.name ).nil?
            @tree << @categories.delete_at(i)
          else
            parent = find_parent( (@categories+@tree), category.parent_name )
            parent << @categories.delete_at(i)
          end
        end
      end

      @tree.sort { |c1, c2| c1.name <=> c2.name }.map(&:to_html).join("")
    end

    def find_parent( ary, pname )
      ary.each do |element|
        return element if element.name == pname
        next if element.empty?
        parent = find_parent(element, pname)
        return parent if parent
      end
      nil
    end

    def linkpath_to category
      @category_dir + category.gsub(/_|\P{Word}/u, '-').gsub(/-{2,}/u, '-').downcase
    end

    def get_parent_name(cname)
      @config[ to_category_key(cname) ]
    end

  end

end

Liquid::Template.register_tag('category_tree', Jekyll::CategoryTree)