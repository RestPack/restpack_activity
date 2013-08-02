require 'forwardable'

class Page
  include Enumerable
  extend Forwardable

  def_delegators :@items, :each, :<<

  attr_reader :response, :items

  def initialize(response, key)
    @response = response
    @key = key
    @items = []

    response.result[key].each do |item|
      @items << yield(item)
    end
  end

  def count
    meta :count
  end

  def page
    meta :page
  end

  def page_size
    meta :page_size
  end

  def page_count
    meta :page_count
  end

  def previous_page
    meta :previous_page
  end

  def next_page
    meta :next_page
  end

  def previous_page?
    previous_page != nil
  end

  def next_page?
    next_page != nil
  end

  private

  def meta(property)
    @response.result[:meta][@key][property]
  end
end
