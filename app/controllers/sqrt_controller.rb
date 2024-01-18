class SqrtController < ApplicationController
  require 'net/http'
  require 'nokogiri'

  before_action only: [:input, :view]

  def input
  end

  def view
    port = 3000
    url = URI.parse("http://localhost:#{port}/sqrt/view.xml?v=#{params[:v]}")
    xml_response = Net::HTTP.get(url)

    @side = params[:side]

    if @side == 'server'
      @result = xslt_transform(xml_response)
    elsif @side == 'client'
      @result = insert_browser_xslt(xml_response)
      File.write('debug.xml', @result)
    end
  end

  private

  def xslt_transform(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read("#{Rails.root}/public/some_transformer.xslt".freeze))
    xslt.transform(doc).to_html
  end

  def insert_browser_xslt(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc, 'xml-stylesheet', 'type="text/xsl" href="/some_transformer.xslt"')
    doc.root.add_previous_sibling(xslt)
    doc.to_xml
  end
end
