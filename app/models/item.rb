# encoding: utf-8
class Item < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  #def delete(id)
   # @items.delete(id)
  #end
end
