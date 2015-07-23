class SearchSuggestion < ActiveRecord::Base
  
  def self.terms_for(prefix)
    suggestions = where("term like ?",  "#{prefix}_%")
    suggestions.order("popularity desc").limit(5).pluck(:term)
  end

  def self.index_products
    Product.find_each do |product|
      index_term(product.title)
      product.title.split.each {|t| index_term(t) }
    end 
  end

  def self.index_term(term)
    where( term: term.downcase).first_or_initialize.tap do |t|
      t.increment! :popularity
    end
  end
end
